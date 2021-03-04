require_relative 'study_item'
Study_item.create_db

REGISTER = 1
VIEW     = 2
SEARCH   = 3
DELETE   = 4
EXIT     = 5

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
    puts "[#{REGISTER}] Cadastrar um item para estudar"
    puts "[#{VIEW}] Ver todos os itens cadastrados"
    puts "[#{SEARCH}] Buscar um item de estudo"
    puts "[#{DELETE}] Deletar um item"
    puts "[#{EXIT}] Sair"
    print 'Escolha uma opção: '
    gets.to_i
end

clear
puts welcome
option = menu

loop do
    clear
    case option
    when REGISTER
        Study_item.register
    when VIEW
        puts Study_item.all
    when SEARCH
        print "Digite o termo para buscar na categoria ou título: "
        query = gets.chomp
        Study_item.search(query)
    when DELETE
        Study_item.delete_item
    when EXIT
        clear
        puts 'Obrigado por usar o Diário de Estudos'
        break
    else
        puts 'Opção inválida'
    end
    clear_and_wait_keypress
    option = menu
end