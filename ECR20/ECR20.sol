pragma solidity ^0.4.24;



contract TokenERC20{

    //variables

    string public name = "Rodo Coin";

    string public symbol = "RMV";

    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    mapping(address => mapping(address => uint256)) public allowance;

    

    // Eventos

    event Transfer(

        address indexed _from,

        address indexed _to,

        uint256 _value

    );

    

    event Approval(

        address indexed _owner,

        address indexed _to,

        uint256 _value

    );

    

    //constructor

    constructor(uint256 _initialSupply) public{

        totalSupply = _initialSupply;

        balanceOf[msg.sender] = _initialSupply;

    }

    

    //metodos

    function transfer(address _to, uint256 _value) public returns (bool){

        require(balanceOf[msg.sender] >= _value);

        

        balanceOf[msg.sender] -= _value;

        balanceOf[_to] += _value;

        

        //Ejecutar Evento

        emit Transfer(msg.sender, _to, _value);

        

        return true;

    }

    

    function approve(address _spender, uint256 _value) public returns (bool){

        allowance[msg.sender][_spender] = _value;

        

        // ejecuta Evento

        emit Approval(msg.sender, _spender, _value);

        

        return true;

    }

    

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool){

        //verificar saldo

        require(_value <= balanceOf[_from]);

        

        //verificar que tenga permitido gastar esa cantidad

        require(_value <= allowance[_from][msg.sender]);

        

        balanceOf[_from] -= _value;

        balanceOf[_to] += _value;

        

        //ejecuto el Evento

        emit Transfer(_from, _to, _value);

        return true;
    }
}

