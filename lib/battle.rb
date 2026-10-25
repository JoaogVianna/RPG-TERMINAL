
require_relative "player"
require_relative "enemy"

class Battle
  def initialize(jogador, inimigo)
    @jogador = jogador
    @inimigo = inimigo
  end

  def iniciar
    puts "\nUm #{@inimigo.nome} apareceu!"

    while @jogador.vida > 0 && @inimigo.vivo?
      puts "\nSua vida: #{@jogador.vida}"
      puts "Vida do #{@inimigo.nome}: #{@inimigo.vida}"

      puts "\n1 - Atacar"
      puts "2 - Fugir"
      print "Escolha: "

      escolha = gets&.chomp
      break if escolha.nil?

      case escolha
      when "1"
        atacar
      when "2"
        puts "Voce fugiu!"
        break
      else
        puts "Opcao invalida!"
      end
    end

    puts "Game Over!" if @jogador.vida <= 0
  end

  def atacar
    dano = rand(10..@jogador.ataque)
    @inimigo.receber_dano(dano)

    puts "Voce causou #{dano} de dano!"

    if !@inimigo.vivo?
      puts "Voce derrotou o #{@inimigo.nome}!"
      @jogador.xp += @inimigo.xp
      puts "Ganhou #{@inimigo.xp} XP!"
      return
    end

    @jogador.vida -= @inimigo.ataque
    puts "O #{@inimigo.nome} te atacou!"
    puts "Voce perdeu #{@inimigo.ataque} de vida!"
  end
end
