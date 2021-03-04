require 'sqlite3'

class Study_item 

    def self.create_db()
        begin
            db = SQLite3::Database.new 'data.db'
            db = SQLite3::Database.open "data.db"
            db.execute "CREATE TABLE IF NOT EXISTS Todos(id INTEGER PRIMARY KEY, Title TEXT, Category TEXT)"
        rescue SQLite3::Exception => exception
            puts "Erro: #{exception}"
        ensure
            db.close if db
        end
    end

    def self.register
        begin
            db = SQLite3::Database.open "data.db"

            print 'Digite o título do seu item de estudo: '
            title = gets.chomp
            print 'Digite a categoria do seu item de estudo: '
            category = gets.chomp
            puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"

            db.execute "INSERT INTO Todos VALUES(NULL, ? ,?)", title, category
        rescue SQLite3::Exception => e
            puts "Erro: #{e}"
        ensure
            db.close if db
        end
    end

    def self.search(query)
        begin
            db = SQLite3::Database.open "data.db"
            items = db.execute "select * from Todos WHERE title LIKE ? OR category LIKE ?", "%#{query}%" 
            items.empty? ? (p "item não encontrado!") : items.each {|todos| p to_string(todos)}
        rescue => exception
            puts "Erro: #{exception}"
        ensure
            db.close if db
        end
    end
    
    def self.all
        begin
            db = SQLite3::Database.open "data.db"
            all_items = db.execute( "select * from Todos" )
            all_items.each{|item| p to_string(item)} 
            "Nenhum item cadastrado!" if all_items.empty?   
        rescue => exception
            "Erro: #{exception}"
        ensure
            db.close if db
        end
    end

    def self.delete_item
        begin
            db = SQLite3::Database.open "data.db"
            puts "=========== lista de itens ==============="
            self.all
            puts "=========================================="
            print "Selecione o item que deseja apagar pelo '#' ou 0 para sair: "
            item = gets.chomp.to_i
            return p "Saindo..." if item == 0
            db.execute "DELETE FROM Todos WHERE id = ?", item
            p "Deletando o item: #{item}"

        rescue => exception
            "Erro: #{exception}"
        ensure
            db.close if db
        end
    end

    def self.to_string(item)
        "##{item[0]} - #{item[1]} - #{item[2]}"
    end
end