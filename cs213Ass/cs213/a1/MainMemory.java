package arch.sm213.machine.student;

import machine.AbstractMainMemory;


/**
 * Main Memory of Simple CPU.
 *
 * Provides an abstraction of main memory (DRAM).
 */

public class MainMemory extends AbstractMainMemory {

    private byte [] mem;
  
  /**
   * Allocate memory.
   * @param byteCapacity size of memory in bytes.
   */
  public MainMemory (int byteCapacity) {
    mem = new byte [byteCapacity];
  }
  
  /**
   * Determine whether an address is aligned to specified length.
   * @param address memory address.
   * @param length byte length.
   * @return true iff address is aligned to length.
   */
  @Override protected boolean isAccessAligned (int address, int length) {
      if((address % length)== 0){
          return true;
      }
      else return false;
  }
  
  /**
   * Convert an sequence of four bytes into a Big Endian integer.
   * @param byteAtAddrPlus0 value of byte with lowest memory address (base address).
   * @param byteAtAddrPlus1 value of byte at base address plus 1.
   * @param byteAtAddrPlus2 value of byte at base address plus 2.
   * @param byteAtAddrPlus3 value of byte at base address plus 3 (highest memory address).
   * @return Big Endian integer formed by these four bytes.
   */
  @Override public int bytesToInteger (byte byteAtAddrPlus0, byte byteAtAddrPlus1, byte byteAtAddrPlus2, byte byteAtAddrPlus3) {
      int M = 0xFF;
      int integ = 0;
      integ = byteAtAddrPlus3 & M;
      integ = integ | ((byteAtAddrPlus2 & M) << 8);
      integ = integ | ((byteAtAddrPlus1 & M) << 16);
      integ = integ | ((byteAtAddrPlus0 & M) << 24);
      return integ;
  }
  
  /**
   * Convert a Big Endian integer into an array of 4 bytes organized by memory address.
   * @param  i an Big Endian integer.
   * @return an array of byte where [0] is value of low-address byte of the number etc.
   */
  @Override public byte[] integerToBytes (int i) {
      {
          byte[] bresult = new byte[4];

          bresult[0] = (byte) (i >> 24);
          bresult[1] = (byte) (i >> 16);
          bresult[2] = (byte) (i >> 8);
          bresult[3] = (byte) (i);

          return bresult;

      }
  }
  
  /**
   * Fetch a sequence of bytes from memory.
   * @param address address of the first byte to fetch.
   * @param length  number of bytes to fetch.
   * @throws InvalidAddressException  if any address in the range address to address+length-1 is invalid.
   * @return an array of byte where [0] is memory value at address, [1] is memory value at address+1 etc.
   */
  @Override protected byte[] get (int address, int length) throws InvalidAddressException {


      byte[] bytearray = new byte[length];

      for (int i = 0; i < length; i++){
          bytearray[i] = mem[address+i];

      }
      return bytearray;
  }


    //          for (int j = 0; j<length; j++){
//              bytearray[j] = mem[i];
//          }

//      bytearray[0] = (byte) (length >> 24);
//      bytearray[1] = (byte) (length >> 16);
//      bytearray[2] = (byte) (length >> 8);
//      bytearray[3] = (byte) (length);



    /**
   * Store a sequence of bytes into memory.
   * @param  address                  address of the first byte in memory to recieve the specified value.
   * @param  value                    an array of byte values to store in memory at the specified address.
   * @throws InvalidAddressException  if any address in the range address to address+value.length-1 is invalid.
   */
  @Override protected void set (int address, byte[] value) throws InvalidAddressException {

      int n = value.length;

      for (int i=0; i<n; i++){

              mem[address + i] = (value[i]);//(byte)(value[i]);
      }
  }


//      mem[address] = (byte)(value[0] >> 24);
//      mem[address + 1] = (byte)(value[1] >> 16);
//      mem[address + 2] = (byte)(value[2]>>8);
//      mem[address+ 3] = (byte)(value[3]);


  /**
   * Determine the size of memory.
   * @return the number of bytes allocated to this memory.
   */
  @Override public int length () {
    return mem.length;
  }


}
