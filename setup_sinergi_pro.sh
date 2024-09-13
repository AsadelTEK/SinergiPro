
#!/bin/bash

# Define variables
PROJECT_NAME="SinergiPro"
CI_VERSION="4.1.9"
BOOTSTRAP_VERSION="5.1.3"

# Step 1: Download CodeIgniter
echo "Downloading CodeIgniter..."
wget https://github.com/codeigniter4/CodeIgniter4/archive/refs/tags/v$CI_VERSION.zip -O codeigniter.zip
unzip codeigniter.zip
mv CodeIgniter4-$CI_VERSION $PROJECT_NAME
rm codeigniter.zip

# Step 2: Install Bootstrap
echo "Downloading Bootstrap..."
mkdir -p $PROJECT_NAME/public/assets/css
wget https://cdn.jsdelivr.net/npm/bootstrap@$BOOTSTRAP_VERSION/dist/css/bootstrap.min.css -O $PROJECT_NAME/public/assets/css/bootstrap.min.css

# Step 3: Setup the database config
echo "Configuring database..."
cat <<EOL > $PROJECT_NAME/app/Config/Database.php
<?php
namespace Config;

use CodeIgniter\Database\Config;

class Database extends Config
{
    public \$defaultGroup = 'default';

    public \$default = [
        'DSN'      => '',
        'hostname' => 'localhost',
        'username' => 'root',
        'password' => '',
        'database' => 'sinergi_pro_db',
        'DBDriver' => 'MySQLi',
        'DBPrefix' => '',
        'pConnect' => false,
        'DBDebug'  => (ENVIRONMENT !== 'production'),
        'cacheOn'  => false,
        'cacheDir' => '',
        'charset'  => 'utf8',
        'DBCollat' => 'utf8_general_ci',
        'swapPre'  => '',
        'encrypt'  => false,
        'compress' => false,
        'strictOn' => false,
        'failover' => [],
        'port'     => 3306,
    ];
}
EOL

# Step 4: Create controllers
echo "Creating controllers..."
mkdir -p $PROJECT_NAME/app/Controllers
cat <<EOL > $PROJECT_NAME/app/Controllers/Penjualan.php
<?php
namespace App\Controllers;
use App\Models\PenjualanModel;

class Penjualan extends BaseController {
    public function index() {
        \$model = new PenjualanModel();
        \$data['sales'] = \$model->findAll();
        echo view('penjualan/index', \$data);
    }
    public function create() {
        echo view('penjualan/create');
    }
}
EOL

# Step 5: Create models
echo "Creating models..."
mkdir -p $PROJECT_NAME/app/Models
cat <<EOL > $PROJECT_NAME/app/Models/PenjualanModel.php
<?php
namespace App\Models;
use CodeIgniter\Model;

class PenjualanModel extends Model {
    protected \$table = 'sales';
    protected \$allowedFields = ['customer_name', 'product_id', 'quantity', 'total_price'];
}
EOL

# Step 6: Create views
echo "Creating views..."
mkdir -p $PROJECT_NAME/app/Views/penjualan
cat <<EOL > $PROJECT_NAME/app/Views/penjualan/index.php
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css">
    <title>Penjualan</title>
</head>
<body>
<div class="container">
    <h2 class="mt-5">Daftar Penjualan</h2>
    <table class="table table-bordered mt-3">
        <tr>
            <th>Nama Pelanggan</th>
            <th>Produk</th>
            <th>Jumlah</th>
            <th>Total Harga</th>
        </tr>
        <?php foreach(\$sales as \$sale): ?>
            <tr>
                <td><?= \$sale['customer_name'] ?></td>
                <td><?= \$sale['product_id'] ?></td>
                <td><?= \$sale['quantity'] ?></td>
                <td><?= \$sale['total_price'] ?></td>
            </tr>
        <?php endforeach; ?>
    </table>
</div>
</body>
</html>
EOL

# Final Step: Display success message
echo "Project setup completed successfully! Navigate to the $PROJECT_NAME folder to start your CodeIgniter project."
