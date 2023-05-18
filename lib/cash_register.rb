class CashRegister
    attr_accessor :total, :discount, :items
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
    end
  
    def add_item(title, price, quantity = 1)
      @total += price * quantity
      quantity.times { @items << title }
    end
  
    def apply_discount
      if @discount > 0
        discount_amount = (@total * @discount / 100.0).to_i
        @total -= discount_amount
        "After the discount, the total comes to $#{@total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      last_item_price = 0
      last_item = @items.pop
  
      if last_item
        @total -= last_item.price
      end
  
      @total = 0.0 if @items.empty?
    end
  end
  