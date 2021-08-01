<?php

    if(isset($_REQUEST['codigo'])){
        // prepara conexao
        $conexao = mysqli_connect("localhost","root","", "imobiliaria") or die("Erro");
        
        if($conexao) {
            echo mysqli_connect_error();
        }
        
        $codigo = $_GET['codigo'];

        // contrato
        $query = "DELETE FROM contrato WHERE codigo = '$codigo';";
        $result = mysqli_query($conexao, $query) or die(mysql_error());

    }
    
    header('Location: ../contratos.php');
    exit;
    return;
?>