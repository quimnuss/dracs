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


static func Instantiate(order_ : Order, flowers_ : Array[Color], paper_ : int, ribbon_ : Color, start_time_ : int, has_petals_ : bool) -> OrderDelivery:
    var delivery : OrderDelivery = OrderDelivery.new()
    delivery.update_delivery(order_, flowers_, paper_, ribbon_, start_time_, has_petals_)
    return delivery


static func get_distance(target : Array[Color], guess : Array[Color]) -> float:
    var num_matches : int = 0
    # aggressive, first color must match
    # we could maybe look for sequence matches or something and be more generous
    for i in range(min(len(target),len(guess))):
        if target[i] == guess[i]:
            num_matches += 1
    var precision_ : float = num_matches/float(len(target))
    return precision_


func update_delivery(order_ : Order, flowers_ : Array[Color], paper_ : int, ribbon_ : Color, start_time_ : int, has_petals_ : bool):
    self.order = order_
    self.flowers = flowers_
    self.paper = paper_
    self.ribbon = ribbon_
    self.precision = get_distance(order.flowers, self.flowers)
    self.start_time = start_time_
    self.elapsed = (Time.get_ticks_msec() - start_time_)
    self.rating = rating_logic()
    self.has_petals = has_petals_

const HALF_SCORE = 50
@export var MAX_PRECISION_SCORE := 50
@export var MAX_TIME_SCORE := 50


func rating_logic():     
    var min_elapsed := 20000
    var max_elapsed := 100000
    var ratio = clamp(1 - (elapsed - min_elapsed)/float(max_elapsed - min_elapsed), 0, 1)
    var rating_ = precision * MAX_PRECISION_SCORE + ratio * MAX_TIME_SCORE
    if has_petals:
        rating_ = rating_*0.5
    return rating_
    

func update_flowers(flowers_ : Array[Color]):
    self.flowers = flowers_
    self.precision = get_distance(order.flowers, self.flowers)
    self.elapsed = (Time.get_ticks_msec() - start_time)
    self.rating = rating_logic()


func update_elapsed(start_time_ : int):
    self.elapsed = (Time.get_ticks_msec() - start_time_)
    self.rating = rating_logic()
