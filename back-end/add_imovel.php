<?php
    // prepara conexao
    $conexao = mysqli_connect("localhost","root","", "imobiliaria") or die("Erro");
    
    if($conexao) {
        echo mysqli_connect_error();
    }
    
    // valida
    if(isset($_REQUEST['submit'])) {
        $inputTipo = $_REQUEST['inputTipo'];
        $cpfProprietario = $_REQUEST['cpfProprietario'];
        $cpfCorretor = $_REQUEST['cpfCorretor'];
        
        $inputTamanho = $_REQUEST['inputTamanho'];

        $inputCEP = $_REQUEST['inputCEP'];
        $inputCidade = $_REQUEST['inputCidade'];
        $inputRua = $_REQUEST['inputRua'];
        $inputNum = $_REQUEST['inputNum'];
        $inputBairro = $_REQUEST['inputBairro'];


        // cidade cep
        $query = "INSERT INTO cep_cidadecliente (cep, cidade)
         VALUES ('$inputCEP', '$inputCidade')";
        $result = mysqli_query($conexao, $query);

        echo $query;
        // cliente
        $query = "INSERT INTO `imovel` (`tamanho`, `alugado`, `tipo`,
         `endBairro`,  `endNum`, `endRua`, `cep`, `cpfProprietario`) VALUES
         ('$inputTamanho', '0', '$inputTipo', 
         '$inputBairro', '$inputNum', '$inputRua', '$inputCEP', '$cpfProprietario');";
         echo $query;
        $result = mysqli_query($conexao, $query);
        
        if($result) {
            // gerencia
            $query = "SELECT * FROM imovel ORDER BY codigo DESC";
            $result = mysqli_query($conexao, $query);

            if($row = mysqli_fetch_array($result)) {
                $cod = $row['codigo'];
                $query = "INSERT INTO gerencia (codImovel, cpfCorretor)
                VALUES ('$cod', '$cpfCorretor')";
                $result = mysqli_query($conexao, $query);
            }
            
        }
        
        
        $conexao->close();
    }

    //header('Location: ../cadastro_imovel.php');
    exit;
    return;
?>