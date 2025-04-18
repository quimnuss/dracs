extends Node

@warning_ignore_start('unused_signal')
signal shipped(ram : RamActor)

signal delivered(order_delivery : OrderDelivery)

signal order_accepted()
@warning_ignore_restore('unused_signal')
