extends Resource
class_name OrderDelivery

@export var order : Order
@export var flowers : Array[Color]
@export var paper : int
@export var ribbon : Color
@export var precision : float
@export var start_time : int
@export var elapsed : int
@export var rating : float
@export var has_petals : bool


static func Instantiate(order : Order, flowers : Array[Color], paper : int, ribbon : Color, start_time : int, has_petals : bool) -> OrderDelivery:
    var delivery : OrderDelivery = OrderDelivery.new()
    delivery.update_delivery(order, flowers, paper, ribbon, start_time, has_petals)
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


func update_delivery(order : Order, flowers : Array[Color], paper : int, ribbon : Color, start_time : int, has_petals : bool):
    self.order = order
    self.flowers = flowers
    self.paper = paper
    self.ribbon = ribbon
    var precision : float = get_distance(order.flowers, self.flowers)
    self.precision = precision
    self.start_time = start_time
    self.elapsed = (Time.get_ticks_msec() - start_time)
    self.rating = rating_logic()
    self.has_petals = has_petals

const HALF_SCORE = 50
@export var MAX_PRECISION_SCORE := 50
@export var MAX_TIME_SCORE := 50


func rating_logic():     
    var min_elapsed := 20000
    var max_elapsed := 100000
    var ratio = clamp(1 - (elapsed - min_elapsed)/(max_elapsed - min_elapsed), 0, 1)
    var rating = precision * MAX_PRECISION_SCORE + ratio * MAX_TIME_SCORE
    if has_petals:
        rating = rating*0.5
    return rating
    

func update_flowers(flowers : Array[Color]):
    self.flowers = flowers
    var precision : float = get_distance(order.flowers, self.flowers)
    self.precision = precision
    self.elapsed = (Time.get_ticks_msec() - start_time)
    self.rating = rating_logic()


func update_elapsed(start_time : int):
    self.elapsed = (Time.get_ticks_msec() - start_time)
    self.rating = rating_logic()
