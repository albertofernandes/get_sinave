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

crit_defi_caso <- ("")
sinais_sintomas_preenchem <- ("")
crit_laborato <- ("")
anteriormente_tratado <- ("")
num_trat_anteriores <- ("")
motivo_insucesso <- ("")
se_outro_motivo <- ("")
bcg <- ("")
data_bcg <- ("")
fatores_risco <- ("")
depend_alcool <- ("")
depend_droga <- ("")
tabagismo <- ("")
programa_subst <- ("")
outras_dependencias <- ("")
vih_sida <- ("")
vih_infeciologia <- ("")
medicacao_antiretrovirica <- ("")
dpoc <- ("")
dpoc_qual <- ("")
medicacao_biologica <- ("")
neoplasia <- ("")
recluso <- ("")
residencia_comunitaria <- ("")
crianca_5_anos <- ("")
sem_abrigo <- ("")
outras_doencas_cronicas <- ("")
riscos_transmissao <- ("")
infecciosidade_caso <- ("")
estimatitva_infe <- ("")
aval_risco <- ("")
vig_contactos <- ("")
contacto_outros_doentes <- ("")
foram_identificados_contactos <- ("")
tod <- ("")
loca_da_tod <- ("")
visita_domicil <- ("")
intervencao_social <- ("")
visita_trabalho <- ("")
informacao_adicional <- ("")
osbervacoes_dsp <- ("")


df_database <- data.frame("pdf_file", data_impressao, num_do_caso, data_do_caso, estado_do_caso, not_associadas, data_primeira_not, pais_ocorrencia, distrito_ocorrencia, concelho_ocorrencia, freguesia_ocorrencia, morada_ocorrencia, nome_doente, num_id_civil, num_utente, sexo, data_nascimento, idade_na_notif, contacto, naturalidade, nactionalidade, morada_utente, pais_utente, distrito_utente, concelho_utente, freguesia_utente, nome_medico, ced_profissional, autoridade_regional, autoridade_local, instituicao_medico_notificador, crit_defi_caso, sinais_sintomas_preenchem, crit_laborato, anteriormente_tratado, num_trat_anteriores, motivo_insucesso, se_outro_motivo, bcg, data_bcg, fatores_risco, depend_alcool, depend_droga, tabagismo, programa_subst, outras_dependencias, vih_sida, vih_infeciologia, medicacao_antiretrovirica, dpoc, dpoc_qual, medicacao_biologica, neoplasia, recluso, residencia_comunitaria, crianca_5_anos, sem_abrigo, outras_doencas_cronicas, riscos_transmissao, infecciosidade_caso, estimatitva_infe, aval_risco, vig_contactos, contacto_outros_doentes, foram_identificados_contactos, tod, loca_da_tod, visita_domicil, intervencao_social, visita_trabalho, informacao_adicional, osbervacoes_dsp
)
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
  
  
  crit_defi_caso <- str_match(pdf_text,"(\\s*)(Critérios para definição de caso:)( *)(.*)( *)(.*)")[1,5]
  sinais_sintomas_preenchem <- str_match(pdf_text,"(\\s*)(O Doente apresenta os sinais e sintomas que preenchem os)( *)(.*)( *)(.*)")[1,5]
  crit_laborato <- str_match(pdf_text,"(\\s*)(Apresenta critérios laboratoriais para classificação do caso)( *)(.*)( *)(.*)")[1,5]
  anteriormente_tratado <- str_match(pdf_text,"(\\s*)(O doente já foi anteriormente tratado para a tuberculose.:)( *)(.*)( *)(.*)")[1,5]
  num_trat_anteriores <- str_match(pdf_text,"(\\s*)(Número de tratamentos anteriores::)( *)(.*)( *)(.*)")[1,5]
  motivo_insucesso <- str_match(pdf_text,"(\\s*)(Qual o motivo do insucesso.:)( *)(.*)( *)(.*)")[1,5]
  se_outro_motivo <- str_match(pdf_text,"(\\s*)(Se outro, qual.:)( *)(.*)( *)(.*)")[1,5]
  bcg <- str_match(pdf_text,"(\\s*)(Vacina BCG:)( *)(.*)( *)(.*)")[1,5]
  data_bcg <- str_match(pdf_text,"(\\s*)(Data última inoculação:)( *)(.*)( *)(.*)")[1,5]
  fatores_risco <- str_match(pdf_text,"(\\s*)(Factores de risco:)( *)(.*)( *)(.*)")[2,5]
  depend_alcool <- str_match(pdf_text,"(\\s*)(Dependência alcoólica:)( *)(.*)( *)(.*)")[2,5]
  depend_droga <- str_match(pdf_text,"(\\s*)(Dependência de Drogas:)( *)(.*)( *)(.*)")[2,5]
  tabagismo <- str_match(pdf_text,"(\\s*)(Tabagismo:)( *)(.*)( *)(.*)")[2,5]
  programa_subst <- str_match(pdf_text,"(\\s*)(Em programa de substituição actualmente.:)( *)(.*)( *)(.*)")[2,5]
  outras_dependencias <- str_match(pdf_text,"(\\s*)(Outras Dependências::)( *)(.*)( *)(.*)")[2,5]
  vih_sida <- str_match(pdf_text,"(\\s*)(VIH. SIDA:)( *)(.*)( *)(.*)")[2,5]
  vih_infeciologia <- str_match(pdf_text,"(\\s*)(Acompanhado em consulta de infecciologia:)( *)(.*)( *)(.*)")[2,5]
  medicacao_antiretrovirica <- str_match(pdf_text,"(\\s*)(Medicação antiretrovírica atual:)( *)(.*)( *)(.*)")[2,5]
  dpoc <- str_match(pdf_text,"(\\s*)(Doença pulmonar crónica:)( *)(.*)( *)(.*)")[2,5]
  dpoc_qual <- str_match(pdf_text,"(\\s*)(Qual.:)( *)(.*)( *)(.*)")[2,5]
  medicacao_biologica <- str_match(pdf_text,"(\\s*)(Medicação Biológica:)( *)(.*)( *)(.*)")[2,5]
  neoplasia <- str_match(pdf_text,"(\\s*)(Neoplasia:)( *)(.*)( *)(.*)")[2,5]
  recluso <- str_match(pdf_text,"(\\s*)(Recluso:)( *)(.*)( *)(.*)")[2,5]
  residencia_comunitaria <- str_match(pdf_text,"(\\s*)(Residência comunitária:)( *)(.*)( *)(.*)")[2,5]
  crianca_5_anos <- str_match(pdf_text,"(\\s*)(Criança . 5 anos:)( *)(.*)( *)(.*)")[2,5]
  sem_abrigo <- str_match(pdf_text,"(\\s*)(Sem abrigo:)( *)(.*)( *)(.*)")[2,5]
  outras_doencas_cronicas <- str_match(pdf_text,"(\\s*)(Outras doenças crónicas ou fatores de risco atuais::)( *)(.*)( *)(.*)")[2,5]
  riscos_transmissao <- str_match(pdf_text,"(\\s*)(Riscos de Transmissão:)( *)(.*)( *)(.*)")[2,5]
  infecciosidade_caso <- str_match(pdf_text,"(\\s*)(Infeciosidade do caso::)( *)(.*)( *)(.*)")[2,5]
  estimatitva_infe <- paste(str_match(pdf_text,"(\\s*)(Estimativa do período de infecciosidade: Desde que ano e)( *)(.*)( *)(.*)")[2,5],str_match(pdf_text,"(\\s*)(mês .aaaa.mm.:)( *)(.*)( *)(.*)")[2,5], sep = " ")
  aval_risco <- str_match(pdf_text,"(\\s*)(Avaliação do risco de infecciosidade do caso:)( *)(.*)( *)(.*)")[2,5]
  vig_contactos <- str_match(pdf_text,"(\\s*)(Vigilância de Contactos:)( *)(.*)( *)(.*)")[2,5]
  contacto_outros_doentes <- str_match(pdf_text,"(\\s*)(Teve contacto com outro.s. doente.s. nos 2 anos)( *)(.*)( *)(.*)")[2,5]
  foram_identificados_contactos <- str_match(pdf_text,"(\\s*)(Foram identificadosos contactos:)( *)(.*)( *)(.*)")[2,5]
  tod <- str_match(pdf_text,"(\\s*)(Tratamento incluíu TOD:)( *)(.*)( *)(.*)")[2,5]
  loca_da_tod <- str_match(pdf_text,"(\\s*)(Local da TOD:)( *)(.*)( *)(.*)")[3,5]
  visita_domicil <- str_match(pdf_text,"(\\s*)(Visita domiciliária:)( *)(.*)( *)(.*)")[3,5]
  intervencao_social <- str_match(pdf_text,"(\\s*)(Necessidade de intervenção social:)( *)(.*)( *)(.*)")[3,5]
  visita_trabalho <- str_match(pdf_text,"(\\s*)(Visita ao local de trabalho:)( *)(.*)( *)(.*)")[3,5]
  informacao_adicional <- str_match(pdf_text,regex("(\\s*)(Informação adicional:)(.*)(Observaç)", dotall = TRUE))[3,4]
  #informacao_adicional <- gsub("\\s", "", informacao_adicional)
  osbervacoes_dsp <- str_match(pdf_text,"(\\s*)(Observações DSP:)( *)(.*)( *)(.*)")[3,5]
  
  df_database[nrow(df_database) + 1,] = c(pdf_file, data_impressao, num_do_caso, data_do_caso, estado_do_caso, not_associadas, data_primeira_not, pais_ocorrencia, distrito_ocorrencia, concelho_ocorrencia, freguesia_ocorrencia, morada_ocorrencia, nome_doente, num_id_civil, num_utente, sexo, data_nascimento, idade_na_notif, contacto, naturalidade, nactionalidade, morada_utente, pais_utente, distrito_utente, concelho_utente, freguesia_utente, nome_medico, ced_profissional, autoridade_regional, autoridade_local, instituicao_medico_notificador, crit_defi_caso, sinais_sintomas_preenchem, crit_laborato, anteriormente_tratado, num_trat_anteriores, motivo_insucesso, se_outro_motivo, bcg, data_bcg, fatores_risco, depend_alcool, depend_droga, tabagismo, programa_subst, outras_dependencias, vih_sida, vih_infeciologia, medicacao_antiretrovirica, dpoc, dpoc_qual, medicacao_biologica, neoplasia, recluso, residencia_comunitaria, crianca_5_anos, sem_abrigo, outras_doencas_cronicas, riscos_transmissao, infecciosidade_caso, estimatitva_infe, aval_risco, vig_contactos, contacto_outros_doentes, foram_identificados_contactos, tod, loca_da_tod, visita_domicil, intervencao_social, visita_trabalho, informacao_adicional, osbervacoes_dsp
)
  
  }

rio::export(df_database, paste0(pdf_folder,"basedados_inquerito.xlsx"))


