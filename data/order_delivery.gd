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
@export var msg : String


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
    self.has_petals = has_petals_
    rating_logic()

const HALF_SCORE = 50
@export var MAX_PRECISION_SCORE := 50
@export var MAX_TIME_SCORE := 50

func time_rating() -> float:
    var min_elapsed := 40000
    var max_elapsed := 130000
    var time_ratio = clamp(1 - (elapsed - min_elapsed)/float(max_elapsed - min_elapsed), 0, 1)
    prints('time ratio etc', time_ratio, elapsed, start_time, Time.get_ticks_msec())
    return time_ratio

func base_rating():
    var time_ratio = time_rating()
    rating = precision * MAX_PRECISION_SCORE + time_ratio * MAX_TIME_SCORE

func rating_logic():
    base_rating()
    if len(flowers) == 0:
        msg = 'Que em vols prendre el pèl? Aquí no hi ha cap rosa.'
        rating = 0
        Singleton.order_approval = 0
        return
    else:
        if has_petals:
            rating = 0.3 * rating
            msg = 'Gràcies! Mmmh però aquestes fulles podrides les podries haver tret amb les tisores. En fi! Gràcies.'
            Singleton.order_approval -= 20
            return
        elif ribbon == Color.BLACK: 
            rating = 0.5 * rating
            msg = 'No hi poses llaç? Vaja, ok.'
            Singleton.order_approval -= 10
            return
        elif precision < 0.75:
            var seq_bbc = ''
            for color : Color in order.flowers:
                seq_bbc += '[color=#%s]*[/color]' % color.to_html()
            var delivery_seq_bbc = ''
            for color : Color in self.flowers:
                delivery_seq_bbc += '[color=#%s]*[/color]' % color.to_html()
            msg = "T'havia demanat una altra cosa. Volia %s i m'has entregat %s. T'ho agafo perquè no tinc temps que ho tornis a fer." % [seq_bbc, delivery_seq_bbc]
            rating = 0.6 * rating
            Singleton.order_approval -= 20
            return
        elif time_rating() < 0.4:
            msg = "Porto molta estona esperant... Gràcies, però."
            rating = 0.7 * rating
            return
        elif len(flowers) - len(order.flowers) > 0:
            rating = 0.9 * rating
            msg = "Gràcies! Hi ha més roses de les que m'esperava, però ja les regalaré a algú altre"
            return
        elif rating < OrderDelivery.HALF_SCORE:
            msg = 'Bé, suposo que amb això farem'
            return
        else:
            rating = rating
            msg = 'Que bé! Exactament el què volia! Gràcies!'
            return            
    

func update_flowers(flowers_ : Array[Color]):
    self.flowers = flowers_
    self.precision = get_distance(order.flowers, self.flowers)
    self.elapsed = (Time.get_ticks_msec() - start_time)
    rating_logic()


func update_elapsed(start_time_ : int):
    self.elapsed = (Time.get_ticks_msec() - start_time_)
    rating_logic()
