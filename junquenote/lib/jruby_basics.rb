# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'java'
require 'jemmy.jar'
require 'junquenote_app'

java_import 'org.netbeans.jemmy.JemmyProperties'
java_import 'org.netbeans.jemmy.TestOut'

%w(Frame TextArea MenuBar Dialog Button).each do |o|
  java_import "org.netbeans.jemmy.operators.J#{o}Operator"
end

JemmyProperties.set_current_timeout 'DialogWaiter.WaitDialogTimeout', 3000
JemmyProperties.set_current_output TestOut.get_null_output

JunqueNoteApp.new
main_window = JFrameOperator.new 'JunqueNote'

puts "The main window's object ID is #{main_window.object_id}."

edit = JTextAreaOperator.new main_window
edit.type_text "this is some text"

menu = JMenuBarOperator.new main_window
menu.push_menu_no_block 'File|Exit' , '|' 

dialog = JDialogOperator.new "Quittin' time"
button = JButtonOperator.new dialog, "No"
button.push