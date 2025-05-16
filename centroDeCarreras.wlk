import elAlambiqueViajero.*

object centroDeCarreras {
    const vehiculosAceptados = #{}
    const vehiculosRechazados = #{}
    var ciudadActual = paris
    method inscribir(unVehiculo) {
        if (unVehiculo.puedeLlegar(ciudadActual)) {
            vehiculosAceptados.add(unVehiculo)
        }
        else{
            vehiculosRechazados.add(unVehiculo)
        }
    }
    method ciudad(unaCiudad) {
        ciudadActual = unaCiudad
    }
    method ciudad() = ciudadActual
    method replanificacion(nuevaCiudad) {
        self.ciudad(nuevaCiudad)
        self.verificarVehiculosAceptados()
    }
    method verificarVehiculosAceptados() {
        var auxArray = vehiculosAceptados.copy()
        vehiculosAceptados.removeAll(vehiculosAceptados.filter{vehiculo => not vehiculo.puedellegar(ciudadActual)})
        vehiculosRechazados.addAll(auxArray.filter{vehiculo => not vehiculo.puedellegar(ciudadActual)})
    }
//  incorporando a los que fueron rechazados anteriormente pero que puedan participar en la nueva sede.
    method comenzarCarrera() {
        vehiculosAceptados.forEach({vehiculo =>
            vehiculo.viajar(ciudadActual)
        })
    }
    method obtenerGanador() {
//El objetivo central es obtener al ganador de la carrera, que es el vehículo que completa la carrera en menos tiempo.
    }
}

/*
Nuevos vehículos
Agregar estos nuevos vehículos:

Uno de los autos, la "Antigualla Blindada" está integrada por varios gangsters,
 de quienes sólo conocemos sus nombres. Si bien originalmente son 7, 
 antes de la carrera podrían bajarse alguno o subirse alguno más.
  Su velocidad se calcula a partir de la cantidad de letras de todos los nombres juntos.
El vehículo conducido por Pierre Nodoyuna y Patán si bien es más rápido que muchos otros, 
siempre intentan hacer trampas o perjudicar a los otros corredores y terminan tardando más en llegar a la meta.
El profesor Locovich usa un vehículo que va cambiando de forma y simula ser otros.
 Implementarlo con una lista de posibles vehículos en los que se puede convertir
  sucesivamente y permitir que lo haga antes que comience la carrera.

*/