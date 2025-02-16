package main

import (
	"fmt"
	"os"

	"github.com/ava-labs/avalanchego/snow/engine/snowman/block"
)

// CustomVM ist unsere minimale Blockchain-VM
type CustomVM struct {
	block.ChainVM
}

// Initialize wird beim Start der VM aufgerufen
func (vm *CustomVM) Initialize() error {
	fmt.Println("PKI Blockchain VM initialized!")
	return nil
}

// Run führt die VM aus
func (vm *CustomVM) Run() error {
	fmt.Println("PKI Blockchain VM running!")
	select {} // Unendliche Schleife, damit die VM läuft
}

func main() {
	vm := &CustomVM{}
	if err := vm.Initialize(); err != nil {
		fmt.Println("Error initializing VM:", err)
		os.Exit(1)
	}
	if err := vm.Run(); err != nil {
		fmt.Println("Error running VM:", err)
		os.Exit(1)
	}
}


