using Godot;
using System;
/******************************************************************************/
/*!
@file   Default.cs
@author Devone Reynolds
@brief
        This is the implementation file for all member functions
        of a class called Default. This is a stub file used as a template for
        code documentation.

        Operarions include:

        - Summation of two numbers
*/
/******************************************************************************/

/******************************************************************************/
/*!
@class  Default
@brief
        A stub class used to demostrate code documentation.
*/
/******************************************************************************/
public class Default : Node
{
    /**************************************************************************/
    /*!
    @brief 
        A stub class used to demostrate code documentation.
    */
    /**************************************************************************/
    public override void _Ready()
    {

    }

    /**************************************************************************/
    /*!
    @brief 
        Returns the sum of two numbers
    @param[in] operandOne
        First number to be added
    @param[in] operandTwo
        Second number to be added
    */
    /**************************************************************************/
    public int Sum(int operandOne, int operandTwo) => operandOne + operandTwo;
}
