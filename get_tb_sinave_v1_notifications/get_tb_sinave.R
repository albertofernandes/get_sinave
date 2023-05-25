# install and load the pdftools package
install.packages("tidyverse", "pdftools")
library(tidyverse)
library(pdftools)
library(stringr)

#have all the pdf files at the same folder as the r script
#the excel file will also be created there

# set the directory path to the same path as the r script
script_path <- dirname(rstudioapi::getSourceEditorContext()$path)
pdf_folder <- script_path

# get a list of all files in the folder
files <- list.files(pdf_folder)

# filter the list to include only PDF files
pdf_files <- files[grepl(".pdf$", files)]

data_impressao <- ("")
num_do_caso <- ("")
data_do_caso <- ("")
estado_do_caso <- ("")
not_associadas <- ("")
data_primeira_not <- ("")
pais_ocorrencia <- ("")
distrito_ocorrencia <- ("")
concelho_ocorrencia <- ("")
freguesia_ocorrencia <- ("")
morada_ocorrencia <- ("")
nome_doente <- ("")
num_id_civil <- ("")
num_utente <- ("")
sexo <- ("")
data_nascimento <- ("")
idade_na_notif <- ("")
contacto <- ("")
naturalidade <- ("")
nactionalidade <- ("")
morada_utente <- ("")
pais_utente <- ("")
distrito_utente <- ("")
concelho_utente <- ("")
freguesia_utente <- ("")
nome_medico <- ("")
ced_profissional <- ("")
autoridade_regional <- ("")
autoridade_local <- ("")
instituicao_medico_notificador <- ("")
profissao_utente <- ("")
local_de_trabalho <- ("")
apresentacao_da_doenca <- ("")
outra_apresentacao <- ("")
sinais_sintomas <- ("")
sinais_sintomas_tuberculose <- ("")
decisao_ciclo_antitub <- ("")
resultado_anatomo <- ("")
localizacao_principal <- ("")
localizacao_secundaria <- ("")
data_inicio_sintomas <- ("")
ligacao_epidemio <- ("")
quantos_casos <- ("")
data_diagnostico <- ("")
internamento <- ("")
internamento_instituicao <- ("")
exames_laboratoriais <- ("")
isolamento_myco <- ("")
isolamento_acido_myco <- ("")
baciloscopia_positiva <- ("")
exame_histologico <- ("")
exame_histologico_outro <- ("")
data_resultado_lab <- ("")
outros_exames <- ("")
resultado_vih <- ("")
detecao_molecular_multi_resist <- ("")
teste_sens_anti <- ("")
isoniazida <- ("")
rifampicina <- ("")
pirazinamida <- ("")
etambutol <- ("")
estreptomicina <- ("")
canamicina <- ("")
amicacina <- ("")
capreomicina <- ("")
etionamida <- ("")
ciprofloxacina <- ("")
ofloxacina <- ("")
cicloserina <- ("")
acida_oara_amino <- ("")
rifabutina <- ("")
clofazimina <- ("")
proteinamida <- ("")
levofloxacina <- ("")
moxifloxacina <- ("")
gatifloxacina <- ("")
claritromicina <- ("")
amoxi_clav <- ("")
linezolide <- ("")
outro_atb <- ("")
agente <- ("")
classificacao_caso <- ("")
tratamento_atual <- ("")
tratamento_atual_outro <- ("")
data_inicio_tratamento <- ("")
faleceu <- ("")
data_obito <- ("")
observacoes <- ("")

df_database <- data.frame("pdf_file", data_impressao, num_do_caso, data_do_caso, estado_do_caso, not_associadas, data_primeira_not, pais_ocorrencia, distrito_ocorrencia, concelho_ocorrencia, freguesia_ocorrencia, morada_ocorrencia, nome_doente, num_id_civil, num_utente, sexo, data_nascimento, idade_na_notif, contacto, naturalidade, nactionalidade, morada_utente, pais_utente, distrito_utente, concelho_utente, freguesia_utente, nome_medico, ced_profissional, autoridade_regional, autoridade_local, instituicao_medico_notificador, profissao_utente, local_de_trabalho, apresentacao_da_doenca, outra_apresentacao, sinais_sintomas, sinais_sintomas_tuberculose, decisao_ciclo_antitub, resultado_anatomo, localizacao_principal, localizacao_secundaria, data_inicio_sintomas, ligacao_epidemio, quantos_casos, data_diagnostico, internamento, internamento_instituicao, exames_laboratoriais, isolamento_myco, isolamento_acido_myco, baciloscopia_positiva, exame_histologico, exame_histologico_outro, data_resultado_lab, outros_exames, resultado_vih, detecao_molecular_multi_resist, teste_sens_anti, isoniazida, rifampicina, pirazinamida, etambutol, estreptomicina, canamicina, amicacina, capreomicina, etionamida, ciprofloxacina, ofloxacina, cicloserina, acida_oara_amino, rifabutina, clofazimina, proteinamida, levofloxacina, moxifloxacina, gatifloxacina, claritromicina, amoxi_clav, linezolide, outro_atb, agente, classificacao_caso, tratamento_atual, tratamento_atual_outro, data_inicio_tratamento, faleceu, data_obito, observacoes)
df_database

# loop through each PDF file
for (pdf_file in pdf_files) {
  # do something with the PDF file, e.g., extract text
  pdf_text <- pdf_text(paste(pdf_folder, pdf_file, sep = "\\"))
  
  data_impressao <- str_match(pdf_text, "\\s*Data de Impressão: (.*)")[1,2]
  
  num_do_caso <- str_match(pdf_text, "\\s*Nº do caso: (.*)")[1,2]
  data_do_caso <- str_match(pdf_text, "\\s*Data do caso: (.*)")[1,2]
  estado_do_caso <- str_match(pdf_text, "\\s*Estado do Caso: (.*)")[1,2]
  not_associadas <- str_match(pdf_text, "\\s*Notificações associadas: (.*)")[1,2]
  data_primeira_not <- str_match(pdf_text, "\\s*Data da primeira notificação: (.*)")[1,2]
  
  pais_ocorrencia <- str_match(pdf_text, "\\s*País de Ocorrência: (.*)(Distrito)")[1,2]
  distrito_ocorrencia <- str_match(pdf_text, "\\s*País de Ocorrência: (.*)(Distrito: )(.*)(Concelho)")[1,4]
  concelho_ocorrencia <- str_match(pdf_text, "\\s*País de Ocorrência: (.*)(Distrito: )(.*)(Concelho: )(.*)(Freguesia: )(.*)")[1,6]
  freguesia_ocorrencia <- str_match(pdf_text, "\\s*País de Ocorrência: (.*)(Distrito: )(.*)(Concelho: )(.*)(Freguesia: )(.*)")[1,8]
  morada_ocorrencia <- str_match(pdf_text, "\\s*Morada: (.*)")[1,2]
  
  nome_doente <- str_match(pdf_text, "\\s*Nome: (.*)")[1,2]
  num_id_civil <- str_match(pdf_text,"\\s*Nº Identificação Civil: (.*)")[1,2]
  num_utente <- str_match(pdf_text,"\\s*Nº de Utente: (.*)(Sexo)")[1,2]
  sexo <- str_match(pdf_text,"\\s*Nº de Utente: (.*)(Sexo: )(.*)")[1,4]
  data_nascimento <- str_match(pdf_text,"\\s*Data nascimento: (.*)(Idade Na Notificação:)(.*)(Contacto)(.*)")[1,2]
  idade_na_notif <- str_match(pdf_text,"\\s*Data nascimento: (.*)(Idade Na Notificação: )(.*)(Contacto)(.*)")[1,4]
  contacto <- str_match(pdf_text,"\\s*Data nascimento: (.*)(Idade Na Notificação:)(.*)(Contacto: )(.*)")[1,6]
  naturalidade <- str_match(pdf_text,"\\s*Naturalidade: (.*)(Nacionalidade: )(.*)")[1,2]
  nactionalidade <- str_match(pdf_text,"\\s*Naturalidade: (.*)(Nacionalidade: )(.*)")[1,4]
  morada_utente <- str_match(pdf_text, "\\s*Morada: (.*)")[1,2]
  pais_utente <- str_match(pdf_text, "\\s*País: (.*)(Distrito)")[1,2]
  distrito_utente <- str_match(pdf_text, "\\s*País: (.*)(Distrito: )(.*)(Concelho)")[1,4]
  concelho_utente <- str_match(pdf_text, "\\s*País: (.*)(Distrito: )(.*)(Concelho: )(.*)(Freguesia: )(.*)")[1,6]
  freguesia_utente <- str_match(pdf_text, "\\s*País: (.*)(Distrito: )(.*)(Concelho: )(.*)(Freguesia: )(.*)")[1,8]
  
  nome_medico <- str_match(pdf_text,"Identificação do Médico\\s*Nome: (.*)")[1,2]
  ced_profissional <- str_match(pdf_text,"\\s*Cédula profissional: (.*)")[1,2]
  autoridade_regional <- str_match(pdf_text,"\\s*Autoridade de Saúde Regional: (.*)")[1,2]
  autoridade_local <- str_match(pdf_text,"\\s*Autoridade de Saúde Local: (.*)")[1,2]
  instituicao_medico_notificador <- str_match(pdf_text,"\\s*Instituição: (.*)")[1,2]
  
  profissao_utente <- str_match(pdf_text,"(\\s*)(Profissão::)( *)(.*)")[1,5]
  local_de_trabalho <- str_match(pdf_text,"(\\s*)(Local de Trabalho::)( *)(.*)")[1,5]
  apresentacao_da_doenca <- str_match(pdf_text,"(\\s*)(Apresentação da doença:)( *)(.*)")[1,5]
  outra_apresentacao <- str_match(pdf_text,"(\\s*)(Se outra apresentação, qual.:)( *)(.*)")[1,5]
  sinais_sintomas <- str_match(pdf_text,"(\\s*)(Sinais e Sintomas:)( *)(.*)")[1,5]
  sinais_sintomas_tuberculose <- str_match(pdf_text,"(\\s*)(Sinais. sintomas e.ou imagens radiológicas compatíveis      )(.*)( *)(.*)")[1,4]
  decisao_ciclo_antitub <- str_match(pdf_text,"(\\s*)(Decisão tomada por um médico de administrar ao doente      )(.*)( *)(.*)")[1,4]
  
  resultado_anatomo <- str_match(pdf_text,"(\\s*)(Resultado anatomopatológico ou necrópsico compatível)( *)(.*)( *)(.*)")[2,5]
  localizacao_principal <- str_match(pdf_text,"(\\s*)(Localização principal:)( *)(.*)( *)(.*)")[2,5]
  localizacao_secundaria <- str_match(pdf_text,"(\\s*)(Localização secundária:)( *)(.*)( *)(.*)")[2,5]
  data_inicio_sintomas <- str_match(pdf_text,"(\\s*)(Data do início dos sintomas:)( *)(.*)( *)(.*)")[2,5]
  ligacao_epidemio <- str_match(pdf_text,"(\\s*)(Ligação epidemiológica com caso provável ou confirmado:)( *)(.*)( *)(.*)")[2,5]
  quantos_casos <- str_match(pdf_text,"(\\s*)(Quantos casos.:)( *)(.*)( *)(.*)")[2,5]
  data_diagnostico <- str_match(pdf_text,"(\\s*)(Data do diagnóstico:)( *)(.*)( *)(.*)")[2,5]
  internamento <- str_match(pdf_text,"(\\s*)(Internamento:)( *)(.*)( *)(.*)")[2,5]
  internamento_instituicao <- str_match(pdf_text,"(\\s*)(Qual a instituição.:)( *)(.*)( *)(.*)")[2,5]
  exames_laboratoriais <- str_match(pdf_text,"(\\s*)(Exames laboratoriais:)( *)(.*)( *)(.*)")[2,5]
  isolamento_myco <- str_match(pdf_text,"(\\s*)(Isolamento do complexo Mycobacterium tuberculosis)( *)(.*)( *)(.*)")[2,5]
  isolamento_acido_myco <- str_match(pdf_text,"(\\s*)(Deteção de ácido nucleico do complexo Mycobacterium)( *)(.*)( *)(.*)")[2,5]
  baciloscopia_positiva <- str_match(pdf_text,"(\\s*)(Baciloscopia positiva por microscopia ótica)( *)(.*)( *)(.*)")[2,5]
  exame_histologico <- str_match(pdf_text,"(\\s*)(Exame histológico revela lesões granulomatosas:)( *)(.*)( *)(.*)")[2,5]
  exame_histologico_outro <- str_match(pdf_text,"(\\s*)(Se outro.s. exame.s. indique qual.is..:)( *)(.*)( *)(.*)")[2,5]
  data_resultado_lab <- str_match(pdf_text,"(\\s*)(Data do resultado laboratorial:)( *)(.*)( *)(.*)")[2,5]
  outros_exames <- str_match(pdf_text,"(\\s*)(Outros exames::)( *)(.*)( *)(.*)")[2,5]
  resultado_vih <- str_match(pdf_text,"(\\s*)(Resultado da pesquisa de VIH na altura do diagnóstico:)( *)(.*)( *)(.*)")[2,5]
  detecao_molecular_multi_resist <- str_match(pdf_text,"(\\s*)(Deteção molecular de multi-resistências:)( *)(.*)( *)(.*)")[2,5]
  teste_sens_anti <- str_match(pdf_text,"(\\s*)(Teste de Sensibilidade aos Antimicrobianos .TSA. de 1.)( *)(.*)( *)(.*)")[2,5]
  isoniazida <- str_match(pdf_text,"(\\s*)(Isoniazida ...:)( *)(.*)( *)(.*)")[2,5]
  rifampicina <- str_match(pdf_text,"(\\s*)(Rifampicina ...:)( *)(.*)( *)(.*)")[2,5]
  pirazinamida <- str_match(pdf_text,"(\\s*)(Pirazinamida ...:)( *)(.*)( *)(.*)")[2,5]
  etambutol <- str_match(pdf_text,"(\\s*)(Etambutol ...:)( *)(.*)( *)(.*)")[2,5]
  estreptomicina <- str_match(pdf_text,"(\\s*)(Estreptomicina ...:)( *)(.*)( *)(.*)")[2,5]
  canamicina <- str_match(pdf_text,"(\\s*)(Canamicina ....:)( *)(.*)( *)(.*)")[2,5]
  amicacina <- str_match(pdf_text,"(\\s*)(Amicacina ....:)( *)(.*)( *)(.*)")[2,5]
  capreomicina <- str_match(pdf_text,"(\\s*)(Capreomicina ....:)( *)(.*)( *)(.*)")[2,5]
  etionamida <- str_match(pdf_text,"(\\s*)(Etionamida ....:)( *)(.*)( *)(.*)")[2,5]
  ciprofloxacina <- str_match(pdf_text,"(\\s*)(Ciprofloxacina ....:)( *)(.*)( *)(.*)")[2,5]
  
  ofloxacina <- str_match(pdf_text,"(\\s*)(Ofloxacina ...:)( *)(.*)( *)(.*)")[3,5]
  cicloserina <- str_match(pdf_text,"(\\s*)(Cicloserina ....:)( *)(.*)( *)(.*)")[3,5]
  acida_oara_amino <- str_match(pdf_text,"(\\s*)(Ácido Para-aminosalicílico .....:)( *)(.*)( *)(.*)")[3,5]
  rifabutina <- str_match(pdf_text,"(\\s*)(Rifabutina .....:)( *)(.*)( *)(.*)")[3,5]
  clofazimina <- str_match(pdf_text,"(\\s*)(Clofazimina .....:)( *)(.*)( *)(.*)")[3,5]
  proteinamida <- str_match(pdf_text,"(\\s*)(Proteinamida ....:)( *)(.*)( *)(.*)")[3,5]
  levofloxacina <- str_match(pdf_text,"(\\s*)(Levofloxacina ......:)( *)(.*)( *)(.*)")[3,5]
  moxifloxacina <- str_match(pdf_text,"(\\s*)(Moxifloxacina .....:)( *)(.*)( *)(.*)")[3,5]
  gatifloxacina <- str_match(pdf_text,"(\\s*)(Gatifloxacina ......:)( *)(.*)( *)(.*)")[3,5]
  claritromicina <- str_match(pdf_text,"(\\s*)(Claritromicina ......:)( *)(.*)( *)(.*)")[3,5]
  amoxi_clav <- str_match(pdf_text,"(\\s*)(Amoxicilina .Ácido Clavulânico .......:)( *)(.*)( *)(.*)")[3,5]
  linezolide <- str_match(pdf_text,"(\\s*)(Linezolide .....:)( *)(.*)( *)(.*)")[3,5]
  outro_atb <- str_match(pdf_text,"(\\s*)(Se outro. indique qual:)( *)(.*)( *)(.*)")[3,5]
  
  agente <- str_match(pdf_text,"(\\s*)(Agente:)( *)(.*)( *)(.*)")[3,5]
  classificacao_caso <- str_match(pdf_text,"(\\s*)(Classificação do caso:)( *)(.*)( *)(.*)")[3,5]
  tratamento_atual <- str_match(pdf_text,"(\\s*)(Tratamento actual .antibiótico - regime inicial.:)( *)(.*)( *)(.*)")[3,5]
  tratamento_atual_outro <- str_match(pdf_text,"(\\s*)(Se outro ou mais antibióticos prescritos. especifique:)( *)(.*)( *)(.*)")[3,5]
  data_inicio_tratamento <- str_match(pdf_text,"(\\s*)(Data do início de tratamento:)( *)(.*)( *)(.*)")[3,5]
  faleceu <- str_match(pdf_text,"(\\s*)(Faleceu:)( *)(.*)( *)(.*)")[3,5]
  data_obito <- str_match(pdf_text,"(\\s*)(Data do óbito:)( *)(.*)( *)(.*)")[3,5]
  observacoes <- str_match(pdf_text,"(\\s*)(Observações:)( *)(.*)( *)(.*)")[3,5]
  
  
  df_database[nrow(df_database) + 1,] = c(pdf_file, data_impressao, num_do_caso, data_do_caso, estado_do_caso, not_associadas, data_primeira_not, pais_ocorrencia, distrito_ocorrencia, concelho_ocorrencia, freguesia_ocorrencia, morada_ocorrencia, nome_doente, num_id_civil, num_utente, sexo, data_nascimento, idade_na_notif, contacto, naturalidade, nactionalidade, morada_utente, pais_utente, distrito_utente, concelho_utente, freguesia_utente, nome_medico, ced_profissional, autoridade_regional, autoridade_local, instituicao_medico_notificador, profissao_utente, local_de_trabalho, apresentacao_da_doenca, outra_apresentacao, sinais_sintomas, sinais_sintomas_tuberculose, decisao_ciclo_antitub, resultado_anatomo, localizacao_principal, localizacao_secundaria, data_inicio_sintomas, ligacao_epidemio, quantos_casos, data_diagnostico, internamento, internamento_instituicao, exames_laboratoriais, isolamento_myco, isolamento_acido_myco, baciloscopia_positiva, exame_histologico, exame_histologico_outro, data_resultado_lab, outros_exames, resultado_vih, detecao_molecular_multi_resist, teste_sens_anti, isoniazida, rifampicina, pirazinamida, etambutol, estreptomicina, canamicina, amicacina, capreomicina, etionamida, ciprofloxacina, ofloxacina, cicloserina, acida_oara_amino, rifabutina, clofazimina, proteinamida, levofloxacina, moxifloxacina, gatifloxacina, claritromicina, amoxi_clav, linezolide, outro_atb, agente, classificacao_caso, tratamento_atual, tratamento_atual_outro, data_inicio_tratamento, faleceu, data_obito, observacoes)
  }

rio::export(df_database, paste0(pdf_folder,"basedados_caso.xlsx"))

