
class Player
  attr_accessor :nome, :vida, :ataque, :nivel, :xp
  attr_reader :vida_maxima

  def initialize(nome)
    @nome = nome
    @vida = 100
    @vida_maxima = 100
    @ataque = 15
    @nivel = 1
    @xp = 0
  end

  def ganhar_xp(quantidade)
    @xp += quantidade
    puts "Voce ganhou #{quantidade} XP!"

    while @xp >= 100
      @xp -= 100
      subir_nivel
    end
  end

  def subir_nivel
    @nivel += 1
    @vida_maxima += 20
    @vida += 20
    @ataque += 3

    puts "\nVoce subiu para o nivel #{@nivel}!"
    puts "Vida maxima: #{@vida_maxima}"
    puts "Ataque: #{@ataque}"
  end

  def mostrar_status
    puts "\nPersonagem: #{@nome}"
    puts "Vida: #{@vida}/#{@vida_maxima}"
    puts "Ataque: #{@ataque}"
    puts "Nivel: #{@nivel}"
    puts "XP: #{@xp}/100"
  end
end
