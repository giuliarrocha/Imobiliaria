<?php
    // prepara conexao
    $conexao = mysqli_connect("localhost","root","", "imobiliaria") or die("Erro");
    
    if($conexao) {
        echo mysqli_connect_error();
    }
    
    // valida
    if(isset($_REQUEST['submit'])) {
        $inputProprietario = $_REQUEST['inputProprietario'];
        $inputCorretor = $_REQUEST['inputCorretor'];
        $inputImovel = $_REQUEST['inputImovel'];
        $inputCliente = $_REQUEST['inputCliente'];
        
        $vencimento1 = str_replace("/", "-", $_POST["vencimento"]);
        $vencimento =  date('Y-m-d', strtotime($vencimento1));

        $inicio1 = str_replace("/", "-", $_POST["inicio"]);
        $inicio =  date('Y-m-d', strtotime($inicio1));
        
        $final1 = str_replace("/", "-", $_POST["final"]);
        $final =  date('Y-m-d', strtotime($final1));

        $inputValor = $_REQUEST['inputValor'];
        $inputPagamento = $_REQUEST['inputPagamento'];

        $inputAvaliacao = $_REQUEST['inputAvaliacao'];

        
        $query = "INSERT INTO `contrato` (`dataVencimento`, `dataInicio`, `dataFinal`, 
        `valorAluguel`,  `formaPagamento`,`avaliacao`, 
        `cpfCliente`, `cpfProprietario`, `cpfCorretor`, `codigoImovel`) VALUES
         ('$vencimento', '$inicio', '$final', 
         '$inputValor', '$inputPagamento', '$inputAvaliacao', 
         '$inputCliente', '$inputProprietario', '$inputCorretor', '$inputImovel');";
         echo $query;
        $result = mysqli_query($conexao, $query);
        
        /*
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
        */
        
        $conexao->close();
    }

    header('Location: ../cadastro_contrato.php');
    exit;
    return;
?>