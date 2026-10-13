class PacksDeViajes
{   
    const beneficios = []
    method duracionEnDias() = 0
    method precioBase() = 0
    method cordinadorACargo() = 0

    method packEsPremium()

    method valorFinal() = 
    (self.precioBase() + beneficios.sum({p => p.costo()}))

}

class PacksNacionales inherits PacksDeViajes
{
    const actividadesIncluidas = []
    method provinciaDeDestino()

    override method valorFinal() = super() + super() * 0.2

    override method packEsPremium() =
    

}

class PacksInternacionales inherits PacksDeViajes
{
    method paisDestino()
    method cantidadDeEscalas()
    method esLugarDeInteres()

}

class Cordinador
{
    var rol = guia
    const roles = [guia , asistenteLogistico, acompaniante]

    method cantidadDeViajes()
    method estaMotivado()
    method aniosDeExperiencia()

    method cambiarDeRol(unRol)
    {
        if (roles.contains(unRol))
        {
            rol = unRol
        }
        else
        {
            self.error("No existe ese rol actualmente")
        }
    }

    method estaAltamenteCapacitado() =
    self.cantidadDeViajes() > 20 &&
    rol.cumpleElRequisito(self)
}

class BeneficiosEspeciales
{
 method tipoDeBeneficio()
 method costo()
 method estaVigente()   

}

class PacksProvinciales inherits PacksNacionales
{


}


object guia
{

    method cumpleElRequisito(unGuia) = unGuia.estaMotivado()

}

object asistenteLogistico
{
    method cumpleElRequisito(unGuia) = unGuia.aniosDeExperiencia() >= 3
}

object acompaniante
{
    method cumpleElRequisito() = true
}