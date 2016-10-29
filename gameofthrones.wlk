class Personaje{
	var casa
	var conyugues = []
	
	constructor(_casa){
		casa = _casa
		casa.agregarMiembro(self)
	}
	
	method puedeCasarseCon(pareja)=	casa.puedeCasarse(self,pareja)
	
	method casa()=casa
	method conyugues() = conyugues
	
	method casamientoPermitido(pareja){
		if(casa.puedeCasarse(self,pareja)&&
		pareja.casa().puedeCasarse(pareja,self)){
			return true
			
		} else{
			return 1
		}
		
	}
	
	method casarCon(pareja){
		if(self.casamientoPermitido(pareja)){
			conyugues.add(pareja)
			pareja.conyugues().add(self)
		}else{
			throw new NoSePuedenCasar()
		}
	}
	
	method patrimonio() = casa.patrimonioIndividual()
	
		
}


class Casa{
	var patrimonio
	var ciudadPrincipal
	var miembros = []
	
	method puedeCasarse(yo,pareja) = false
	method patrimonio(_patrimonio){patrimonio = _patrimonio}
	method patrimonio()=patrimonio
	method ciudadPrincipal(_ciudad){ciudadPrincipal = _ciudad}
	
	method miembros()=miembros
	
	method esRica() = self.patrimonio() > 1000
	
	method patrimonioIndividual()= self.patrimonio() / self.miembros().size()
	
	method agregarMiembro(_personaje){
		miembros.add(_personaje)
	}
	
}


object lannister inherits Casa{
	override method puedeCasarse(yo,pareja)= yo.conyugues().size() == 0
	
}

object stark inherits Casa{
	override method puedeCasarse(yo,pareja)= yo.casa() != pareja.casa()
}

object guardiaNocturna inherits Casa{
	
}


class NoSePuedenCasar{}
