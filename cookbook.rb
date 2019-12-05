require_relative 'receita'

def bem_vindo
  'Bem-vindo ao My Cookbook, sua rede social de receitas culinárias!'
end

def menu
  puts '[1] Cadastrar uma receita'
  puts '[2] Ver todas as receitas'
  puts '[3] Buscar receita'
  puts '[4] Sair'

  print 'Escolha uma opção: '
  gets.to_i()
end

def inserir_receita
  print 'Digite o nome da sua receita: '
  nome = gets.chomp
  print 'Digite o tipo da sua receita: '
  tipo = gets.chomp
  puts "Receita de #{nome} do tipo #{tipo} cadastrada com sucesso!"
  Receita.new(nome, tipo)
end

def imprimir_receita(receitas)    
  receitas.each_with_index do |receita, index|
    puts "##{index + 1} - #{receita}"
  end
  puts 'Nenhuma receita cadastrada' if receitas.empty?
end

def busca_receita(receitas)

  print 'Digite a receita que busca: '
  buscar = gets.chomp
  buscar = buscar.downcase  

  encontrados = 0

  puts 'Inserir nome ou tipo de receita que busca' if buscar.empty?

  receitas.each_with_index do |receita, index|
    if ((receita.nome.downcase.include? buscar) ||(receita.tipo.downcase.include? buscar) )
      puts "##{index + 1} - #{receita}"  
      encontrados += 1
    end    
  end

  if encontrados == 0 
    puts 'Não foram encontradas receitas para este termo, tente novamente'
  end

  puts 'Nenhuma receita cadastrada' if receitas.empty?

end

puts bem_vindo()

opcao = menu()
receitas = []

while opcao != 4
  if opcao == 1
    receitas << inserir_receita
  elsif opcao == 2
    imprimir_receita(receitas)
  elsif opcao == 3
    busca_receita(receitas)
  else
    puts 'Opção inválida'
  end
  
  opcao = menu()
end

puts 'Obrigado por usar o Cookbook'
