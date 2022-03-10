extends Sprite
var nivelRhydonim = 100
var velocidade = 10
var xMin = 0
var xMax=500
var yMin=0
var yMax=500
func inicarLimites(xi,yi,xf,yf):
	xMin 	= xi
	xMax 	= xf
	yMin	= yi
	yMax	= yf
func voltaInicio():
	position.x = (xMax - xMin)/2  + xMin
	position.y = (yMax - yMin)/2  + yMin
func diminuiEnergia(gasto):
	nivelRhydonim -= gasto
func carregarEnergia():
	nivelRhydonim = 100
func acelerar(aceleracao):
	velocidade += aceleracao
func frear(aceleracao):
	velocidade -= aceleracao
func moverDireita():
	move_local_x(velocidade)
func dentroLimites():
	var x = position.x
	var y = position.y
	if x >= xMin and x < xMax and y > yMin and y < yMax:
		return true
	else:
		return false
