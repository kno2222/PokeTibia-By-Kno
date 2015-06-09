CONFIG = {
    [1] = {message = "[Catch Bloqued System] Agora Os Pokemons que Forem Para o Depot Serao Bloqueados, E Para Desbloquear é So dar Use Na Ball Desejada que Acende a Luz Da Ball e Desbloqueia!", color = 22},
    [2] = {message = "[Task-System] Task Automatico de Todos os Pokemons 1-2-3-4 Geraçao Separados por Elemento digita !task. Depois que terminar a Task vai no NPC Mega Task!", color = 22},
   [3] = {message = "[Hunts] Sao 100 Teleportes 1-2-3-4 Geraçoes! (Todos Com chance de Virar Shinys)", color = 22},
   [4] = {message = "[Torneio] Todos os Dias Apartir das 18:00!", color = 22},
   [5] = {message = "[Pokemon] Level Maximo do Pokemon (300)  Boost Level Free (50)   Boost Level VIP (80)!", color = 22},
   [6] = {message = "[Apricorns] Existem Dois Tipos de Apricorns [FREE e VIP] Free: Aumenta 2 Pontos de Atributos nos Stats dos Pokemons / VIP: Aumenta 10 Pontos de Atributos nos Stats dos Pokemons", color = 22},
  [7] = {message = "[Cassino] Agora NPC Cassino Vende Cassino Coins Para Jogar Nas Maquinas,Para Trocar os Coins Por Surpresa Box , Precisa de [500] Cassino Win Scores + 1000 Cassino Coins!", color = 22},
   [8] = {message = "[Bonus Level System] Esse Sistema de Bonus Level funciona Para Somar o Tanto de Level que Voce Upou no Seu Pokemon (Assim Mudando o Comercio no Trade Diferenciando o Tanto de Bonus Level que o Pokemon Teve. Quanto Mais Bonus Level Mais Forte Fica o Pokemon)!", color = 22},
[9] = {message = "[Clan-System] Para Poder entrar em uma Clan e so ir no Teleport Clan (Localizado no Templo) Level Minimo: 80 / Para Subir de Rank de Clan digita !rankclan Para Maiores Informacoes [!clan ou Help].", color = 22},
}
function onThink()
    getRandom = math.random(1, #CONFIG)
    return doBroadcastMessage(CONFIG[getRandom].message, CONFIG[getRandom].color)
end