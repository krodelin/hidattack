defmodule App.AttackDemo do

  require Logger

  @wiggle_normal_frequency 2.0
  @wiggle_normal_amplitude 0.0

  @wiggle_attack_frequency 2.0
  @wiggle_attack_amplitude 0.2

  @mirror_normal 1.0
  @mirror_attack -1.0

  def clear() do
    Logger.debug(fn -> "#{__MODULE__} Clear Attacks" end)
    App.AttackProxy.wiggle(@wiggle_normal_frequency, @wiggle_normal_amplitude)
    App.AttackProxy.mirror(@mirror_normal)
  end

  def wiggle do
    Logger.debug(fn -> "#{__MODULE__} Wiggle" end)
    App.AttackProxy.wiggle(@wiggle_attack_frequency, @wiggle_attack_amplitude)
    App.AttackProxy.mirror(@mirror_normal)
  end

  def mirror() do
    Logger.debug(fn -> "#{__MODULE__} Mirror" end)
    App.AttackProxy.wiggle(@wiggle_normal_frequency, @wiggle_normal_amplitude)
    App.AttackProxy.mirror(@mirror_attack)
  end

  def reboot_hid() do
    Logger.debug(fn -> "#{__MODULE__} Reboot HID" end)
    Nerves.Runtime.reboot()
  end

end
