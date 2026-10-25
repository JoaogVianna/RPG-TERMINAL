
class Enemy
  attr_accessor :nome, :vida, :ataque, :xp

  def initialize(nome, vida, ataque, xp)
    @nome = nome
    @vida = vida
    @ataque = ataque
    @xp = xp
  end

  def self.aleatorio
    monstros = [
      ["Slime", 30, 6, 20],
      ["Goblin", 45, 9, 30],
      ["Esqueleto", 55, 11, 40],
      ["Orc", 80, 15, 60]
    ]

    monstro = monstros.sample
    new(*monstro)
  end

  def vivo?
    @vida > 0
  end

  def receber_dano(dano)
    @vida -= dano
    @vida = 0 if @vida < 0
  end
end
