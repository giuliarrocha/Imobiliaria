<?php

    if(isset($_REQUEST['cpf'])){
        // prepara conexao
        $conexao = mysqli_connect("localhost","root","", "imobiliaria") or die("Erro");
        
        if($conexao) {
            echo mysqli_connect_error();
        }
        
        $cpf = $_GET['cpf'];

        // telefone
        $query = "DELETE FROM telefoneCliente WHERE cpfCliente = '$cpf';";
        $result = mysqli_query($conexao, $query) or die(mysql_error());

        // cidade - opcional

        // contrato
        $query = "DELETE FROM contrato WHERE cpfCliente = '$cpf';";
        $result = mysqli_query($conexao, $query) or die(mysql_error());

        // corretor
        $query = "DELETE FROM cliente WHERE cpf = '$cpf';";
        $result = mysqli_query($conexao, $query) or die(mysql_error());
    }
    
    header('Location: ../clientes.php');
    exit;
    return;
?>