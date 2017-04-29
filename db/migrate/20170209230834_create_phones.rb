class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.string :brand
      t.string :model
      t.string :Technology
      t.string :Speed
      t.string :GPRS
      t.string :EDGE
      t.string :Announced
      t.string :Status
      t.string :Dimensions
      t.string :Weight
      t.string :SIM
      t.string :Type
      t.string :Size
      t.string :Resolution
      t.string :Multitouch
      t.string :Protection
      t.string :OS
      t.string :Chipset
      t.string :CPU
      t.string :Cardslot
      t.string :Internal
      t.string :Primary
      t.string :Features
      t.string :Video
      t.string :Secondary
      t.string :Alerttypes
      t.string :Loudspeaker
      t.string :WLAN
      t.string :Bluetooth
      t.string :GPS
      t.string :Radio
      t.string :USB
      t.string :Sensors
      t.string :Messaging
      t.string :Browser
      t.string :Java
      t.string :Colors
      t.string :GPU
      t.string :Pricegroup
      t.string :Talktime
      t.string :NFC
      t.string :Standby
      t.string :SAREU
      t.string :SARUS
      t.string :Display
      t.string :Camera
      t.string :Audioquality
      t.string :Batterylife
      t.string :Keyboard
      t.string :Performance
      t.string :Musicplay
      t.string :Infraredport
      t.string :Phonebook
      t.string :Callrecords
      t.string :Games
      t.string :Clock
      t.string :Alarm
      t.string :Languages
      t.string :Build
      t.timestamps
    end
  end
end
