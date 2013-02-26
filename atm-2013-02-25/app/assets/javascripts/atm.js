var checking_balance = 2400.53;
var savings_balance = 800.75;
var log = '';

// should have added 'get amount' function, returned calculations to various statements

window.onload=function() {

  $('.checking h2 span').text('$' + checking_balance);
  $('.savings h2 span').text('$' + savings_balance);

};

$(function(){

  $('.checking .withdraw-btn').click(checking_account_withdrawl);
  $('.savings .withdraw-btn').click(savings_account_withdrawl);

  $('.checking .deposit-btn').click(checking_account_deposit);
  $('.savings .deposit-btn').click(savings_account_deposit);

});

function print_statements() {
  $('.checking h2 span').text('$' + checking_balance);
  $('.checking #check').val('');
  $('.savings h2 span').text('$' + savings_balance);
  $('.savings #sav').val('');
}

function checking_account_withdrawl() {
  var entered = parseFloat($('.checking #check').val());
  withdraw(checking_balance, entered);
  print_statements();
}

function savings_account_withdrawl() {
  var entered = parseFloat($('.savings #sav').val());
  withdraw(savings_balance, entered);
  print_statements();
}

function withdraw (account, amount) {
  if( account === checking_balance ) {
    if( account > amount ) {
      checking_balance = account - amount;
      $('.error').hide();
    } else {
      if( (amount - checking_balance) < savings_balance ) {
        amount -= checking_balance;
        checking_balance = 0;
        savings_balance -= amount;
        print_statements();
        $('.checking h2').css('color', 'red');
      } else {
        $('.error').show();
      }
    }
  } else {
    if( account > amount ) {
      savings_balance = account - amount;
      $('.error').hide();
    } else {
      $('.error').show();
    }
  }
}

function checking_account_deposit() {
  var entered = parseFloat($('.checking #check').val());
  deposit(checking_balance, entered);
  print_statements();
  $('.checking h2').css('color', '#222');
}

function savings_account_deposit() {
  var entered = parseFloat($('.savings #sav').val());
  deposit(savings_balance, entered);
  print_statements();
}

function deposit(account, amount) {
  if( account === checking_balance ) {
    checking_balance = account + amount;
    print_statements();
  } else {
    savings_balance = account + amount;
    print_statements();
  }
}