# A simple echo command for shellrb
class Echo
  def self.main params
    # 'finish' is the index of last item in the params entered by the user
    finish = params.length - 1
	case params[0]
      # checks for the option '-n' which prints text without a newline
      when '-n'
		start = 1
		# prints each item from index start (1 here to avoid printing -n) to finish
		# .join(' ') joins the members of params with a space in between them to emulate a string
		print params[start..finish].join(' ')
	  else
        start = 0
		# does the same as above, but prints a newline at the end
		# starts from index 0
        puts params[start..finish].join(' ')
    end
  end
end
