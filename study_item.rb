class Study_item 
    attr_reader :id, :title, :category
    
    @@next_id = 0
    @@study_items = []

    def initialize(title, category)
        @@next_id +=1

        @id = @@next_id
        @title = title
        @category = category

        @@study_items << self
    end

    def self.register
        print 'Digite o título do seu item de estudo: '
        title = gets.chomp
        print 'Digite a categoria do seu item de estudo: '
        category = gets.chomp
        puts "Item '#{title}' da categoria '#{category}' cadastrado com sucesso!"
        new(title, category)
    end

    def self.search(query)
        found = []
        @@study_items.each do |item|
            if item.title.include?(query) || item.category.include?(query)
                found << item
            end
        end
        if found.empty?
            puts "Item não encontrado"
        else
            puts found
        end
    end
    
    def self.all 
        puts @@study_items
    end

    def to_s 
        "##{@id} - #{@title} - #{@category}"
    end
end