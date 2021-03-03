require_relative 'study_item'
def clear
    system('clear')
end

def wait_keypress
    puts
    puts 'Pressione enter para continuar'
    gets
end

def clear_and_wait_keypress
    wait_keypress
    clear
end

def welcome
    'Bem-vindo ao Diário de Estudos, seu companheiro para estudar!'
end

def menu
    puts "[1] Cadastrar um item para estudar"
    puts "[2] Ver todos os itens cadastrados"
    puts "[3] Buscar um item de estudo"
    puts "[4] Sair"
    print 'Escolha uma opção: '
    gets.to_i
end

clear
puts welcome
option = menu

loop do
    clear
    case option
    when 1
        Study_item.register
    when 2
        Study_item.all
    when 3
        print "Digite o termo para buscar na categoria ou título: "
        query = gets.chomp
        Study_item.search(query)
    when 4
        clear
        puts 'Obrigado por usar o Diário de Estudos'
        break
    else
        puts 'Opção inválida'
    end
    clear_and_wait_keypress
    option = menu
end