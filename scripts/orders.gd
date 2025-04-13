extends Resource
class_name Orders

# difficulty higher = harder

static var orders_dict : Dictionary = {
    'senyera' : {
        'order_long': 'Voldria nou roses fent la senyera!',
        'order_short': '9 roses alternant groc i vermell',
        'difficulty': 0,
        'ram': {
            'flowers' : [Color.YELLOW, Color.RED, Color.YELLOW, Color.RED, Color.YELLOW, Color.RED, Color.YELLOW, Color.RED],
            'paper' : 1,
            'ribbon' : Color.RED
        }
    }
}
