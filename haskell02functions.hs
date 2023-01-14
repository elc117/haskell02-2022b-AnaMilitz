--1) Médicos consideram que um indivíduo tem febre quando sua temperatura corporal está acima de 37,8oC. Escreva uma função hasFever :: [Float] -> [Float] que, dada uma lista de temperaturas de indivíduos, selecione aquelas que representam febre. Resolva esta questão definindo uma função auxiliar nomeada, que verifica se uma dada temperatura é febre ou não.
isFever :: Float -> Bool
isFever temperaturaRecebida = temperaturaRecebida > 37.8

hasFever :: [Float] -> [Float]
hasFever listaTemperaturas = filter isFever listaTemperaturas

--2) Escreva uma função hasFever' :: [Float] -> [Float] que resolva a questão anterior usando lambda.
hasFever' :: [Float] -> [Float]
hasFever' listaTemperaturas = filter (\temperaturaRecebida -> temperaturaRecebida > 37.8) listaTemperaturas

--3) Crie uma função itemize :: [String] -> [String] que receba uma lista de strings e adicione tags HTML <li> e </li> antes e depois de cada string. Resolva esta questão usando lambda.
itemize :: [String] -> [String]
itemize listaStrings = map (\word-> "<li>" ++ word ++ "</li>") listaStrings

--4) Escreva uma função bigCircles :: Float -> [Float] -> [Float] que receba um número e uma lista de raios de círculos. Essa função deverá retornar somente aqueles raios de círculos cuja área seja maior que o número passado como argumento.
circleArea :: Float -> Float
circleArea r = pi*(r^2)

bigCircles :: Float -> [Float] -> [Float]
bigCircles numero raiosCirculos = filter (\circleArea-> circleArea > numero) raiosCirculos 

--5) Escreva uma função quarentine :: [(String,Float)] -> [(String,Float)] que receba uma lista de tuplas com nomes de pessoas e suas temperaturas corpóreas, e selecione aquelas que têm febre.
quarentine :: [(String,Float)] -> [(String,Float)]
quarentine pessoasComFebre = filter (\(_,temperatura) -> temperatura > 37.8) pessoasComFebre

--6) Escreva uma função agesIn :: [Int] -> Int -> [Int] que receba uma lista de anos de nascimento de algumas pessoas e um ano de referência. A lista resultante terá idades calculadas considerando o ano de referência (idades aproximadas, já que só consideram o ano, não a data completa de nascimento). Resolva esta questão usando lambda.

agesIn :: [Int] -> Int -> [Int]
agesIn anosNascimento anoReferencia = map (\x -> anoReferencia - x) anosNascimento

--7) Escreva uma função superNames :: [String] -> [String] que receba uma lista de nomes e adicione o prefixo "Super " às strings que começarem com a letra A (maiúscula), deixando as demais inalteradas. A lista resultante, portanto, terá a mesma quantidade de strings da lista original.
startsWithA :: String -> Bool
startsWithA word = head word == 'A'

addSuper :: String -> String
addSuper word = "Super" ++ word

superNames :: [String] -> [String]
superNames nomes = map addSuper (filter startsWithA nomes) 
--versao usando lambda:
superNames' nomes = map addSuper (filter (\startA -> head startA == 'A') nomes)

--8) Escreva uma função onlyShorts :: [String] -> [String] que receba uma lista de strings e retorne outra lista contendo somente as strings cujo tamanho seja menor que 5.
isShortString :: String -> Bool
isShortString string = length string  < 5 

onlyShorts :: [String] -> [String]
onlyShorts listaDeStrings = filter isShortString listaDeStrings


main = do
  --1)
  --print(isFever 38.9)
  print(hasFever [36,36.7, 38, 39, 40.1])

  --2)
  print(hasFever' [35,50, 60, 61, 25])

  --3)
  print(itemize ["palavra", "oi", "ola"])

  --4)
  print(bigCircles 5.0 [4.0,5,6])

--5)
  print(quarentine [("Alisson", 37.9),("Alice", 37.6),("Robson", 37),("Raquel", 39)] )

--6) 
  print(agesIn [2000, 2003, 2006, 1980, 1960] 2023)

--7)
  print(superNames ["Ana", "Alisson", "Raquel"])

--7.1) Extra (versao usando lambda)
  print(superNames' ["Ana", "Alisson", "Raquel"])

--8)
  print(onlyShorts ["Ana", "Oliver", "Carol", "Bob", "Jeny", "Jenny"])
