# Intel Optimized AWS RDS PostgreSQL

This repository deploys a single AWS RDS PostgreSQL instance optimized for databases running on machines with Intel Xeon processors.

## Features

- **AWS RDS PostgreSQL**: Managed PostgreSQL database service.
- **Intel Xeon Optimization**: Enhanced performance for Intel Xeon processors.

## Prerequisites

- AWS account
- AWS CLI configured
- Terraform installed

## Deployment

1. Clone the repository:
    ```sh
    git clone https://github.com/nephoseu/inteloptimizedb.git
    cd inteloptimizedb
    ```

2. Initialize Terraform:
    ```sh
    terraform init
    ```

3. Apply the Terraform configuration:
    ```sh
    terraform apply
    ```

## License

This project is licensed under the MIT License.