# Dockerizer

Dockerizer is a CLI tool that allows you to easily add Docker configurations to your project. It supports different setups for PHP and Node.js, providing a convenient way to integrate Docker into your development workflow.

## Features
- Clone Docker configurations for PHP or Node.js projects.
- Automatically move the Docker Compose file to the root directory.
- Organize Docker setup files into a dedicated `docker` folder.

## Installation
To use Dockerizer, you'll need `git` and `bash` installed on your machine.

1. Clone the repository:

   ```bash
   git clone https://github.com/hazem-hammad/dockerizer
   ```

You will be prompted to choose between a PHP or Node.js Docker setup:

1. **PHP**: Clones the PHP Docker setup and adds it to your current directory.
2. **Node.js**: Clones the Node.js Docker setup and adds it to your current directory.

The script will:
- Clone the Docker setup from the selected branch (`php` or `node`).
- Move the `docker-compose.yml` file to the root of your current directory.
- Organize the rest of the files into a `docker` folder.

## Repository Structure
```
dockerizer/
│
├── src/
│   ├── php/
│   │   ├── docker-compose.yml
│   │   ├── mysql_data/
│   │   └── php/
│   └── node/
│       ├── docker-compose.yml
│       ├── mysql_data/
│       └── node/
└── README.md
```

- **src/php**: Contains Docker files for PHP projects.
- **src/node**: Contains Docker files for Node.js projects.

## License
This project is licensed under the MIT License.

## Contributions
Contributions are welcome! Feel free to open an issue or submit a pull request.

## Author
Created by Hazem Hammad.
