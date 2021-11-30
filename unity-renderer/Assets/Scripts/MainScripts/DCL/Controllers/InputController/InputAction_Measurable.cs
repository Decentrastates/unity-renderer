using System;
using UnityEditor;
using UnityEngine;

/// <summary>
/// An analogical action that raises events when the value is changed. The most common use-case is implementing axis
/// </summary>
[CreateAssetMenu(fileName = "InputAction_Measurable", menuName = "InputActions/Measurable")]
public class InputAction_Measurable : ScriptableObject
{
    public delegate void ValueChanged(DCLAction_Measurable action, float value);
    public event ValueChanged OnValueChanged;

    [SerializeField] internal DCLAction_Measurable dclAction;
    [SerializeField] private float currentValue = 0;
    
    public DCLAction_Measurable GetDCLAction() => dclAction;
    
    public float GetValue() => currentValue;

    internal void RaiseOnValueChanged(float value)
    {
        if (Math.Abs(currentValue - value) > Mathf.Epsilon)
        {
            currentValue = value;
            OnValueChanged?.Invoke(dclAction, currentValue);
        }
    }

    #region Editor

#if UNITY_EDITOR

    [CustomEditor(typeof(InputAction_Measurable), true)]
    internal class InputAction_MeasurableEditor : Editor
    {
        private float changeValue = 0;
        public override void OnInspectorGUI()
        {
            DrawDefaultInspector();
            changeValue = GUILayout.HorizontalSlider(changeValue, 0, 1);
            if (Application.isPlaying && GUILayout.Button("Raise OnChange"))
            {
                ((InputAction_Measurable)target).RaiseOnValueChanged(changeValue);
            }
        }
    }
#endif

    #endregion

}