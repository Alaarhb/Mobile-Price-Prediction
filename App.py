# IMPORTING LIB
import streamlit as st
import numpy as np
import pandas as pd 
import joblib 




# LODING MODEL 
model=joblib.load(r"C:\Users\VICTUS\OneDrive\Desktop\project\model\src\random.pkl")
scaler=joblib.load(r"C:\Users\VICTUS\OneDrive\Desktop\project\model\src\scaler.pkl")

st.set_page_config(page_title="Mobilee",page_icon="🤳")


# FRONT 

st.title("ELHAREFEA PROJECT")

col1,col2=st.columns(2)

Sale=col1.number_input("**how many time the model paied**",min_value=0)

weight=col2.number_input("**weight of the model**")

resoloution=col1.number_input("**what is the resoloution**",min_value=1.0,max_value=10.0,step=0.2)

ppi=col2.number_input("**pecsil per inch**")


cpu_core=col1.number_input("**how many cores at the CPU**",min_value=2,step=1)


cpu_freq=col2.number_input("**what is the frequance of CPU**",min_value=1.0,step=0.05)

internal_mem=col1.number_input("**what is the internal memory**",min_value=4,step=4)

ram=col2.number_input("**how many RAMs**")


RearCam=col1.number_input("**bicsels of Back Cam**")


Front_Cam=col2.number_input("**bicsels of Front Cam**")


battery=col1.number_input("**battery**(mA)")

thickness=col2.number_input("**thockness of mobile**")








# INPUTS
inputs=[Sale, weight, resoloution, ppi, cpu_core, cpu_freq,
       internal_mem, ram, RearCam, Front_Cam, battery, thickness]
inputs=np.array(inputs).reshape(1,-1)


    
# SCALING 

inputs=scaler.transform(inputs)




# PREDICTINO
result=model.predict(inputs)

if st.button("PREDICT"):

    st.write(result)




