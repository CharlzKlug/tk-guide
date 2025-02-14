#!/usr/bin/env tclsh
source character.tcl

oo::class create weapon {
    variable name
    variable attack
    constructor {inputName inputAttack} {
	set name $inputName
	set attack $inputAttack
    }

    method getName {} {
	return $name
    }

    method getAttack {} {
	return $attack
    }
}

oo::class create warrior {

    variable State
    variable weapon
    constructor {name} {
	puts "Warrior constructor"
	next $name
	incr State(defense) 2
	incr State(attack) 2
	set weapon ""
    }

    method changeWeapon {inputWeapon} {
	set weapon $inputWeapon
    }

    method attack {} {
	set weaponAttack [expr {$weapon == "" ? 0 : [$weapon getAttack]}]
	return [expr $State(attack) + $weaponAttack + int(rand() * 5)]
    }

    destructor {
	$weapon destroy
    }
}

oo::class create human {
    variable State
    constructor {name} {
	puts "Human constructor"
	next $name
	incr State(hitpoints) 2
    }
}

oo::class create humanwarrior {
    filter showCall

    superclass human warrior character
    variable State
    constructor {name} {
	puts "Human Warrior constructor"
	next $name
    }
}
