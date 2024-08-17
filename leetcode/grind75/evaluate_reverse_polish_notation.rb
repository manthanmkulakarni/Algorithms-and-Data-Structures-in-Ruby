=begin
You are given an array of strings tokens that represents an arithmetic expression in a Reverse Polish Notation.
Evaluate the expression. Return an integer that represents the value of the expression.
Note that:

1. The valid operators are '+', '-', '*', and '/'.
2. Each operand may be an integer or another expression.
3. The division between two integers always truncates toward zero.(IMP: 6/-132 = -1 in ruby/python not 0 so modify / accordingly )
4. There will not be any division by zero.
5. The input represents a valid arithmetic expression in a reverse polish notation.
6. The answer and all the intermediate calculations can be represented in a 32-bit integer.
=end

# Solution 
def eval_rpn(tokens)
    operations = {
        "+" => ->(a,b) {a+b},
        "-" => ->(a,b) {a-b},
        "*" => ->(a,b) {a*b},
        # "/" => lambda (a,b) { b.zero? ? raise ArgumentError: a/b} (if 4th confition was not given)
        "/" => ->(a,b) {a*b<0 ? -1*(a.abs/b.abs): a/b } # To satisfy 3rd condition we divide absolute values
    }
    op_stack = []
    tokens.each do |token|
       #raise ArgumentError if (op_stack.empty? or op_stack.length==1 ) and operations.has_key?(token) (if 5th confition was not given)
        if operations.has_key?(token)
            b = op_stack.pop
            a = op_stack.pop
            result = operations[token].(a,b)
            p [a,b,result]
            op_stack.push(result)
        else
            op_stack.push(token.to_i)
        end
    end
    op_stack[-1]
end

