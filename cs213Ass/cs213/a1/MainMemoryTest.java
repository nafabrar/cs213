package arch.sm213.machine.student;

import machine.AbstractMainMemory;
import org.junit.Before;
import org.junit.Test;

import java.util.Arrays;

import static junit.framework.Assert.*;


public class MainMemoryTest {

    private MainMemory mm1;
    private byte byte1;
    private byte byte2;
    private byte byte3;
    private byte byte4;
    private byte[] mem;
    private byte[] mm;
    private byte[] result1;
    private byte[] result2;

    @Before
    public void setUp(){
        mm1 = new MainMemory(8);
        mem = new byte[4];
        mm = new byte [8];

        byte1 = 01;
        byte2 = 02;
        byte3 = 03;
        byte4 = 04;
        mm[0] = byte4;
        mm[1] = byte1;
        mm[2] = byte2;
        mm[3] = byte3;
        mm[4] = byte4;
        mm[5] = byte1;
        mm[6] = byte2;
        mm[7] = byte3;

        result1 = new byte[3];

        result1[0] = byte3;
        result1[1] = byte4;
        result1[2] = byte1;

        result2 = new byte[4];


        result2[0] = byte2;
        result2[1] = byte3;
        result2[2] = byte4;
        result2[3] = byte1;


    }

    @Test
    public void testIsAccessAligned() {
        assertTrue(mm1.isAccessAligned(2, 2));
        assertTrue(mm1.isAccessAligned(6, 3));
        assertFalse(mm1.isAccessAligned(11, 4));
        assertFalse(mm1.isAccessAligned(1, 20));

    }

    @Test
    public void testBytesToInteger() {


        assertEquals(mm1.bytesToInteger(byte1, byte2, byte3, byte4), 16909060);

        byte1 = 0x34;
        byte2 = 0x20;
        byte3 = 0x45;
        byte4 = 0x79;
        assertEquals(mm1.bytesToInteger(byte1, byte2, byte3, byte4), 874530169);



    }

    @Test
    public void testIntegerToBytes() {
        mem[0] = 04;
        mem[1] = 03;
        mem[2] = 02;
        mem[3] = 01;
        assertTrue(Arrays.equals(mm1.integerToBytes(67305985), mem));

        mem[0] = 02;
        mem[1] = 07;
        mem[2] = 06;
        mem[3] = 03;
        assertTrue(Arrays.equals(mm1.integerToBytes(34014723), mem));


    }

    @Test
    public void testGet() throws AbstractMainMemory.InvalidAddressException {
        try{
            mm1.set(0, mm);
            byte[] r1;
            r1 = mm1.get(3, 3);
            assertTrue(Arrays.equals(r1, result1));

            byte[] r2;
            r2 = mm1.get(2, 4);
            assertTrue(Arrays.equals(r2, result2));

        } catch(AbstractMainMemory.InvalidAddressException e){
            fail();
        }

    }


    @Test
    public void testSet() throws AbstractMainMemory.InvalidAddressException {
        try {
            mm1.set(0, mm);
            byte[] r1;
            r1 = mm1.get(3, 3);
            assertTrue(Arrays.equals(r1, result1));

            byte[] r2;
            r2 = mm1.get(2, 4);
            assertTrue(Arrays.equals(r2, result2));
        } catch(AbstractMainMemory.InvalidAddressException e){
            fail();
        }

    }
}