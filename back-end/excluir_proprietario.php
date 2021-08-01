<?php

    if(isset($_REQUEST['cpf'])){
        // prepara conexao
        $conexao = mysqli_connect("localhost","root","", "imobiliaria") or die("Erro");
        
        if($conexao) {
            echo mysqli_connect_error();
        }
        
        $cpf = $_REQUEST['cpf'];
                
        // contrato
        $query = "DELETE FROM contrato WHERE cpfProprietario = '$cpf';";
        $result = mysqli_query($conexao, $query) or die(mysql_error());

        // imovel
        $query = "DELETE FROM imovel WHERE cpfProprietario = '$cpf';";
        $result = mysqli_query($conexao, $query) or die(mysql_error());

        // conta bancaria - opcional
        //$query = "DELETE FROM agencia_bancariaProprietario, proprietario WHERE conta = contaProprietario AND agencia = agenciaProprietario AND cpf = '$cpf';";
        //$result = mysqli_query($conexao, $query) or die(mysql_error());

        // telefone
        $query = "DELETE FROM telefoneProprietario WHERE cpfProprietario = '$cpf';";
        $result = mysqli_query($conexao, $query) or die(mysql_error());

        // proprietario
        $query = "DELETE FROM proprietario WHERE cpf = '$cpf';";
        $result = mysqli_query($conexao, $query) or die(mysql_error());
    }
    
    header('Location: ../proprietarios.php');
    exit;
    return;
?>