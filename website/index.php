<html>
    <head>
    <title>Docker website</title>
    </head>

    <body>
    <h1>My Products</h1>
    <?php
        $json = file_get_contents("http://34.66.143.60");
        $obj = json_decode($json);

        $products = $obj->products;
        foreach($products as $product)
        {
        ?>
        <li><?php echo $product; ?></li>
        <?
        }
    ?>
    <ul>


    </ul>

    </body>

</html>
