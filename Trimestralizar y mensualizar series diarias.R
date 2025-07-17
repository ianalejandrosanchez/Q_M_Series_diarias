# Mas información visitar 
# https://ianalejandrosanchez.github.io/website/

# Estructura requerida:
# +----------------------+
# |Fecha     |  valor    |
# +----------+-----------+
# |dd/mm/aaaa| 0.00000   |
# |     .    |    .      |
# |     .    |    .      |
# |----------------------|

# Usar install.packages() si se requiere instalar alguna paquetería.

library(dplyr)
library(lubridate)

mi_base <- read_excel("")

# Trimestralizar datos diaros
datos_trimestrales <- mi_base %>%
  mutate(trimestre = paste0(year(Fecha), "-Q", quarter(Fecha))) %>%
  group_by(trimestre) %>%                                         
  summarize(valor_trimestral = mean(valor, na.rm = TRUE))         
print(datos_trimestrales)

# Mensualizar datos diarios
datos_mensuales <- mi_base %>%
   mutate(mes = paste0(year(Fecha), "-M", month(Fecha))) %>%
   group_by(mes) %>%                                         
   summarize(valor_mensual = mean(valor, na.rm = TRUE))         
print(datos_mensuales)

# Exportar series a .csv
write.csv(datos_mensuales, "datos_mensuales.csv", row.names = FALSE)
write.csv(datos_trimestrales, "datos_trimestrales.csv", row.names = FALSE)
