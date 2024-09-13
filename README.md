# Sinergi Pro - A Business and Organization Management System

## Overview

**Sinergi Pro** is a web-based application designed to manage business operations like sales, finance, production, and inventory. It is built using the **CodeIgniter** framework and styled with **Bootstrap** for responsive design.

## Features

- **Sales Management**: Track customer orders, manage product sales, and generate invoices.
- **Finance Management**: Keep records of financial transactions, manage cash flow, and generate financial reports.
- **Production Management**: Plan and track production processes, monitor the use of raw materials, and manage the production cycle.
- **Inventory Management**: Manage and track inventory, monitor stock levels, and optimize storage.

## Installation

To set up this project locally, follow these steps:

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/SinergiPro.git
   cd SinergiPro
   ```

2. **Run the setup script**:
   Run the provided bash script to install **CodeIgniter**, **Bootstrap**, and set up the database configuration.
   ```bash
   bash setup_sinergi_pro.sh
   ```

3. **Set up the database**:
   Import the provided SQL file to set up the database schema.
   ```bash
   mysql -u root -p sinergi_pro_db < path_to/sinergi_pro_database.sql
   ```

4. **Configure the environment**:
   Copy the `.env` example file and update the configuration:
   ```bash
   cp env.example .env
   ```

   Update the following lines in the `.env` file:
   ```bash
   database.default.hostname = localhost
   database.default.database = sinergi_pro_db
   database.default.username = root
   database.default.password = YOUR_PASSWORD
   ```

5. **Start the server**:
   Run the development server using the built-in PHP server:
   ```bash
   php spark serve
   ```

   Open your browser and navigate to `http://localhost:8080` to view the application.

## Usage

### Sales Module

- Navigate to `/penjualan` to view the list of sales.
- Use the "Add Sale" button to add new sales records.

### Finance Module

- Navigate to `/keuangan` to manage financial transactions and view reports.

### Production Module

- Navigate to `/produksi` to monitor the production status and track processes.

### Inventory Module

- Navigate to `/inventaris` to track stock levels and manage inventory items.

## Dependencies

- **CodeIgniter 4.x**
- **Bootstrap 5.x**
- **MySQL**

## License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

