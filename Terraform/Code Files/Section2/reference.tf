provider "aws"{
    region = "ap-south-1"
    access_key = "AKIAREWUAHKSIYKJBXM3"
    secret_key = "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"
}
resource "aws_instance" "test-ec2-instance"{
    ami = "ami-0cca134ec43cf708f" # Image id for the ap-south-1 region
    instance_type = "t2.micro"
    availability_zone = "ap-south-1a"
}

resource "aws_eip" "lb"{
    vpc = true
}

resource "aws_eip_association" "eip_assoc"{
    instance_id = aws_instance.test-ec2-instance.id
    allocation_id = aws_eip.lb.id
}

resource "aws_security_group" "allow_tls"{
    name = "terraform-sg"

    ingress {
        from_port        = 443
        to_port          = 443
        protocol         = "tcp"
        cidr_blocks      = [var.vpn_id]
    }
    ingress {
        from_port        = 80
        to_port          = 80
        protocol         = "tcp"
        cidr_blocks      = [var.vpn_id]
    }
    ingress {
        from_port        = 53
        to_port          = 53
        protocol         = "tcp"
        cidr_blocks      = [var.vpn_id]
    }
}

output "awsEc2"{
    value = [ aws_instance.test-ec2-instance.ami, aws_instance.test-ec2-instance.public_ip ]
}