function love.load()
	love.graphics.setBackgroundColor(169,211,252)
	local x, y = love.mouse.getPosition()
	mouse_x = love.mouse.getX() -- Pega a posicao x do mouse
	mouse_y = love.mouse.getY() -- Pega a posicao y do mouse 
	texto = "Clique com o botao esquerdo do mouse para saber a posicao" -- auto explicativo
	imgdireita = love.graphics.newImage("mario1.png") -- mario andando para direita
	imgesquerda = love.graphics.newImage("mario2.png") -- mario andando para esquerda
	mario = {}
	mario.x = 40
	mario.y = 432
	mario.velocidade = 10
	mario.pulo = 100
	gravity = 1200
	jump_height = 7
	mario.y_velocidade = 0
	winW, winH = love.graphics.getWidth(), love.graphics.getHeight()

end

function love.update(dt)

	if love.keyboard.isDown("right") then
		mario.x = mario.x + mario.velocidade
	end

	if love.keyboard.isDown("left") then
		mario.x = mario.x - mario.velocidade
	end

	if mario.y_velocidade ~= 0 then -- We're probably jumping
		mario.y = mario.y + mario.y_velocidade * dt -- "dt" means we wont move at different speeds if the game lags
		mario.y_velocidade = mario.y_velocidade - gravity * dt
	end

	if mario.y < 370 then -- We hit the ground again
		mario.y_velocidade = 0
		mario.y = 432
	end
end

function love.keypressed(key, scancode, isrepeat)
	if key == "space" then
		if mario.y_velocidade == 0 then -- We're probably on the ground, let's jump
			mario.y_velocidade = jump_height
		end
	end
end


function love.mousepressed(x, y, button) -- 
	if button == 1 then
		texto = "X:"..x.." Y: "..y 
	end
end




function love.draw()

	love.graphics.setColor(19,168,19) -- verde
	love.graphics.rectangle("fill", 0, 520,800, 80) -- grama
	love.graphics.setColor(255,255,0) -- amarelo
	love.graphics.circle("fill", 100, 100, 40) -- sol
	love.graphics.setColor(255,255,0) -- amarelo
	love.graphics.rectangle("fill", 100,93,100,5) -- perna sol direita 
	love.graphics.setColor(255,255,0) -- amarelo
	love.graphics.rectangle("fill", 10,93,100,5) -- perna sol esquerda
	love.graphics.setColor(255,255,0) -- amarelo
	love.graphics.rectangle("fill", 97,15,5,100) -- perno do sol cima
	love.graphics.setColor(255,255,0) -- amarelo
	love.graphics.rectangle("fill", 97,140,5,50) -- perna sol baixo
	love.graphics.setColor(130,130,130) -- cinza
	love.graphics.rectangle("fill", 230,270,200,250) -- casa
	love.graphics.setColor(255,148,54) -- laranja
	love.graphics.polygon('fill', 230, 270, 430 ,270, 330,120) -- telhado casa
	love.graphics.setColor(150,85,53) -- marrom porta
	love.graphics.rectangle("fill", 335,370,70,150) -- porta
	love.graphics.setColor(0,0,0) -- preto
	love.graphics.circle("fill",345,449,6) -- macaneta porta
	love.graphics.setColor(31,46,145) -- azul
	love.graphics.rectangle("fill", 255,400,50,70) -- janela
	love.graphics.setColor(122,60,39) -- marrom tronco
	love.graphics.rectangle("fill", 610,360,40,160) -- tronco arvore
	love.graphics.setColor(77,196,0) -- verde arvore
	love.graphics.circle("fill",630,273,110) -- arvore
	love.graphics.setColor(255,255,255) -- branco
	love.graphics.circle("fill",471,62,40) -- nuvem 1
	love.graphics.setColor(255,255,255) -- branco
	love.graphics.circle("fill",511,62,40) -- nuvem 2
	love.graphics.setColor(255,255,255) -- branco
	love.graphics.circle("fill",560,62,42) -- nuvem 3
	love.graphics.setColor(255,255,255) -- branco
	love.graphics.circle("fill",610,62,40) -- nuvem 4
	love.graphics.draw(imgdireita,mario.x,mario.y) -- mario

	if love.keyboard.isDown("right") then
		love.graphics.draw(imgdireita,mario.x,mario.y) -- mario
	end

	if love.keyboard.isDown("left") then
		love.graphics.draw(imgesquerda,mario.x,mario.y) -- mario
	end



	if love.keyboard.isDown("a") then -- 'abrir' a porta
		love.graphics.setColor(255,255,255) -- branco
		love.graphics.rectangle("fill", 335,370,70,150) -- porta
		love.graphics.setColor(245,186,103) -- cor de pele
		love.graphics.circle("fill",369.5,399,20) -- maluco
		love.graphics.rectangle("fill", 365.5,417,8,60)
		love.graphics.polygon('fill', 368, 476,348 ,522, 352,522)
	end


	love.graphics.setColor(0,0,0)
	love.graphics.print( "Mouse : ".. texto)
end
