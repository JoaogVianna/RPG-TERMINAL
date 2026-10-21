puts "=========================="
puts "     RUBY QUEST RPG"
puts "=========================="

puts "\nBem-vindo, aventureiro!"
print "Digite seu nome: "

nome = gets.chomp

jogador = {
  nome: nome,
  vida: 100,
  ataque: 15,
  nivel: 1,
  xp: 0
}

puts "\nPersonagem criado!"
puts "Nome: #{jogador[:nome]}"
puts "Vida: #{jogador[:vida]}"
puts "Ataque: #{jogador[:ataque]}"
puts "Nivel: #{jogador[:nivel]}"
puts "XP: #{jogador[:xp]}"


monstros = [
  { nome: "Slime", vida: 30, ataque: 6, xp: 20 },
  { nome: "Goblin", vida: 45, ataque: 9, xp: 30 },
  { nome: "Esqueleto", vida: 55, ataque: 11, xp: 40 }
]

monstro = monstros.sample

puts "\n=========================="
puts "     FLORESTA SOMBRIA"
puts "=========================="

puts "\nVocê entrou na floresta..."
puts "Um #{monstro[:nome]} apareceu!"

puts "\nStatus do inimigo:"
puts "Vida: #{monstro[:vida]}"
puts "Ataque: #{monstro[:ataque]}"


puts "\n===== INICIO DO COMBATE ====="

while jogador[:vida] > 0 && monstro[:vida] > 0

  puts "\n--------------------------"
  puts "Sua vida: #{jogador[:vida]}"
  puts "Vida do #{monstro[:nome]}: #{monstro[:vida]}"
  puts "--------------------------"

  puts "1 - Atacar"
  puts "2 - Fugir"
  print "Escolha: "

  escolha = gets.chomp

  case escolha
  when "1"
    monstro[:vida] -= jogador[:ataque]

    puts "\nVocê causou #{jogador[:ataque]} de dano!"

    if monstro[:vida] <= 0
      puts "\nVocê derrotou o #{monstro[:nome]}!"

      jogador[:xp] += monstro[:xp]

      puts "Ganhou #{monstro[:xp]} XP!"
      break
    end

  when "2"
    puts "\nVocê fugiu da batalha!"
    break

  else
    puts "\nOpção inválida!"
    next
  end

  # Turno do monstro
  jogador[:vida] -= monstro[:ataque]

  puts "\nO #{monstro[:nome]} atacou!"
  puts "Você recebeu #{monstro[:ataque]} de dano!"

  if jogador[:vida] <= 0
    puts "\nGAME OVER!"
  end

end

puts "\n===== FIM DA BATALHA ====="
puts "Vida restante: #{[jogador[:vida], 0].max}"
puts "XP total: #{jogador[:xp]}"
