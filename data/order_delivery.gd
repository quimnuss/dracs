extends Resource
class_name OrderDelivery

@export var order : Order
@export var flowers : Array[Color]
@export var paper : int
@export var ribbon : Color
@export var precision : float
@export var start_time : int
@export var elapsed : int


static func Instantiate(order : Order, flowers : Array[Color], paper : int, ribbon : Color, start_time : int) -> OrderDelivery:
    var delivery : OrderDelivery = OrderDelivery.new()
    delivery.update_delivery(order, flowers, paper, ribbon, start_time)
    return delivery


static func get_distance(target : Array[Color], guess : Array[Color]) -> float:
    var num_matches : int = 0
    # aggressive, first color must match
    # we could maybe look for sequence matches or something and be more generous
    for i in range(min(len(target),len(guess))):
        if target[i] == guess[i]:
            num_matches += 1
    var precision : float = num_matches/len(target)
    return precision

func update_delivery(order : Order, flowers : Array[Color], paper : int, ribbon : Color, start_time : int):
    self.order = order
    self.flowers = flowers
    self.paper = paper
    self.ribbon = ribbon
    var precision : float = get_distance(order.flowers, self.flowers)
    self.precision = precision
    self.start_time = start_time
    self.elapsed = (Time.get_ticks_msec() - start_time)


func update_flowers(flowers : Array[Color]):
    self.flowers = flowers
    var precision : float = get_distance(order.flowers, self.flowers)
    self.precision = precision
    self.elapsed = (Time.get_ticks_msec() - start_time)
    

func update_elapsed(start_time : int):
    self.elapsed = (Time.get_ticks_msec() - start_time)
