# encoding: utf-8
#

# Gestionar una Lista doblemente enlazada
class List2 < List
  include Enumerable

  # Lee lista de nodos
  def each
    n = @head
    while n != nil
      yield n.value
      n = n.next
    end  
  end
  
  # Inserta un nodo al principio de la lista
  def ins_start(value)
    if @head != nil && @head.next != nil
      n = @head
      @head = Node.new(value, n, nil)
      n.prev = @head
    elsif @head != nil
      n = @head
      @head = Node.new(value, n, nil)
      n.prev = @head
      @tail = n
    else
      @head = Node.new(value, nil, nil)
      @tail = @head
    end
  end
 
  # Insertar un nodo al final de la lista
  def ins_end(value)
    if @tail != nil
      @tail = Node.new(value, nil, @tail)
      n = @tail.prev
      n.next = @tail
    else
      @head = Node.new(value, nil, nil)
      @tail = @head
    end
  end
  
  # Extrae primer elemento
  def extract_first
    e = @head
    @head = e.next
    if @head != nil
      @head.prev = nil
    else
      @tail = @head
    end
    e
  end  
  
  # Extrae último elemento
  def extract_last
    e = @tail
    @tail = e.prev
    if @tail != nil
      @tail.next = nil
    else
      @head = @tail
    end
    e
  end  

end