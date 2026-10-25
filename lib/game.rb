
require_relative "player"
require_relative "enemy"
require_relative "battle"

class Game
  def initialize
    print "Nome do personagem: "
    nome = gets&.chomp
    nome = "Aventureiro" if nome.nil? || nome.empty?

    @jogador = Player.new(nome)
  end

  def iniciar
    puts "\nBem-vindo ao RubyQuest!"

    loop do
      puts "\n1 - Explorar"
      puts "2 - Ver personagem"
      puts "3 - Sair"
      print "Escolha: "

      escolha = gets&.chomp

      case escolha
      when "1"
        explorar
        break if @jogador.vida <= 0
      when "2"
        @jogador.mostrar_status
      when "3", nil
        puts "Ate a proxima!"
        break
      else
        puts "Opcao invalida!"
      end
    end
  end

  def explorar
    puts "\nVoce saiu para explorar..."

    inimigo = Enemy.aleatorio
    batalha = Battle.new(@jogador, inimigo)
    batalha.iniciar
  end
end
