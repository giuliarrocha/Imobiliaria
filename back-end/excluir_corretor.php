<?php

    if(isset($_REQUEST['cpf'])){
        // prepara conexao
        $conexao = mysqli_connect("localhost","root","", "imobiliaria") or die("Erro");
        
        if($conexao) {
            echo mysqli_connect_error();
        }
        
        $cpf = $_GET['cpf'];

        echo $cpf;
        // telefone
        $query = "DELETE FROM telefoneCorretor WHERE cpfCorretor = '$cpf';";
        $result = mysqli_query($conexao, $query) or die(mysql_error());

        // conta bancaria - opcional
        //$query = "DELETE FROM agencia_bancariaCorretor, corretor WHERE conta = contaCorretor AND agencia = agenciaCorretor AND cpf = '$cpf';";
        //echo $query;
        //$result = mysqli_query($conexao, $query) or die(mysql_error());
        
        // cidade  - opcional
        //$query = "DELETE FROM CEP_CidadeCorretor, corretor WHERE conta = contaCorretor AND agencia = agenciaCorretor AND cpf = '$cpf';";
        //$result = mysqli_query($conexao, $query) or die(mysql_error());

        // gerencia
        $query = "DELETE FROM gerencia WHERE cpfCorretor = '$cpf';";
        $result = mysqli_query($conexao, $query) or die(mysql_error());

        // contrato
        $query = "DELETE FROM contrato WHERE cpfCorretor = '$cpf';";
        $result = mysqli_query($conexao, $query) or die(mysql_error());

        // corretor
        $query = "DELETE FROM corretor WHERE cpf = '$cpf';";
        $result = mysqli_query($conexao, $query) or die(mysql_error());
    }
    
    header('Location: ../corretores.php');
    exit;
    return;
?>