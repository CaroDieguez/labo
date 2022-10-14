# Este script ha sido modificado en base al creado por Gines Garcia Zeman

rm( list=ls() )  #remove all objects
gc()             #garbage collection

require("data.table")
setwd( "c:\\_CienciaDeDatos\\MinDatos2" )

#cargo el dataset
dataset  <- fread( "./datasets/competencia1_historia_2022.csv.gz" )

#IPC de 201901 a 202103 (27 meses)
IPC = c(189.6,196.8,206.0,213.1,219.6,225.5,230.5,239.6,253.7,262.1,273.2,283.4,289.8,295.7,305.6,310.1,314.9,322.0,328.2,337.1,346.6,359.7,371.0,385.9,401.5,415.9,435.9)

#variables a ajustar por IPC, excluyo aquellas 11 variables que habían sido pesificadas previamente.

varMonetarias = c("mrentabilidad","mrentabilidad_annual","mcomisiones","mactivos_margen","mpasivos_margen","mcuenta_corriente_adicional","mcuenta_corriente","mcaja_ahorro","mcaja_ahorro_adicional","mcuentas_saldo","mautoservicio","mtarjeta_visa_consumo","mtarjeta_master_consumo","mprestamos_personales","mprestamos_prendarios","mprestamos_hipotecarios","mplazo_fijo_pesos","minversion1_pesos","minversion2","mpayroll","mpayroll2","mcuenta_debitos_automaticos","mttarjeta_master_debitos_automaticos","mpagodeservicios","mpagomiscuentas","mcajeros_propios_descuentos","mtarjeta_master_descuentos","mcomisiones_mantenimiento","mcomisiones_otras","mforex_buy","mforex_sell","mtransferencias_recibidas","mtransferencias_emitidas","mextraccion_autoservicio","mcheques_depositados","mcheques_emitidos","mcheques_depositados_rechazados","mcheques_emitidos_rechazados","matm","matm_other","Master_mfinanciacion_limite","Master_msaldototal","Master_msaldopesos","Master_mconsumospesos","Master_mlimitecompra","Master_madelantopesos","Master_mpagado","Master_mpagospesos","Master_mconsumototal","Master_mpagominimo","Visa_mfinanciacion_limite","Visa_msaldototal","Visa_msaldopesos","Visa_mconsumospesos","Visa_mlimitecompra","Visa_madelantopesos","Visa_mpagado","Visa_mpagospesos","Visa_mconsumototal","Visa_mpagominimo")

for (var in varMonetarias) { 
  
  dataset[foto_mes == 201901, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[1]), .SDcols = var]
  dataset[foto_mes == 201902, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[2]), .SDcols = var]
  dataset[foto_mes == 201903, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[3]), .SDcols = var]
  dataset[foto_mes == 201904, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[4]), .SDcols = var]
  dataset[foto_mes == 201905, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[5]), .SDcols = var]
  dataset[foto_mes == 201906, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[6]), .SDcols = var]
  dataset[foto_mes == 201907, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[7]), .SDcols = var]
  dataset[foto_mes == 201908, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[8]), .SDcols = var]
  dataset[foto_mes == 201909, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[9]), .SDcols = var]
  dataset[foto_mes == 201910, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[10]), .SDcols = var]
  dataset[foto_mes == 201911, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[11]), .SDcols = var]
  dataset[foto_mes == 201912, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[12]), .SDcols = var]
  dataset[foto_mes == 202001, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[13]), .SDcols = var]
  dataset[foto_mes == 202002, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[14]), .SDcols = var]
  dataset[foto_mes == 202003, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[15]), .SDcols = var]
  dataset[foto_mes == 202004, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[16]), .SDcols = var]
  dataset[foto_mes == 202005, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[17]), .SDcols = var]
  dataset[foto_mes == 202006, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[18]), .SDcols = var]
  dataset[foto_mes == 202007, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[19]), .SDcols = var]
  dataset[foto_mes == 202008, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[20]), .SDcols = var]
  dataset[foto_mes == 202009, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[21]), .SDcols = var]
  dataset[foto_mes == 202010, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[22]), .SDcols = var]
  dataset[foto_mes == 202011, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[23]), .SDcols = var]
  dataset[foto_mes == 202012, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[24]), .SDcols = var]
  dataset[foto_mes == 202101, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[25]), .SDcols = var]
  dataset[foto_mes == 202102, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[26]), .SDcols = var]
  dataset[foto_mes == 202103, (var) := lapply(.SD, '*', IPC[length(IPC)] / IPC[27]), .SDcols = var]
  
}


#grabo el dataset
setwd( "./datasets" )
fwrite( dataset,
        "competencia1_historia_2022_IPCCaro.csv.gz",
        logical01= TRUE,
        sep= "," )